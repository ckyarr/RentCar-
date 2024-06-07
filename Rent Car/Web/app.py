from flask import Flask, render_template, flash, redirect, url_for, session, request, send_from_directory
from flask_mysqldb import MySQL
from wtforms import Form, StringField, FileField, TextAreaField, DateTimeLocalField, PasswordField, DateTimeField, validators, SelectField, FloatField
from wtforms.validators import DataRequired
from passlib.hash import sha256_crypt
from functools import wraps
import numpy as np
from datetime import datetime
import time
import secrets
import os
import random
import string
import locale
from MySQLdb import IntegrityError
from werkzeug.utils import secure_filename
from flask_babel import Babel
from babel.numbers import format_currency

app = Flask(__name__)
babel = Babel(app)

# Atur locale ke Bahasa Indonesia
locale.setlocale(locale.LC_ALL, 'id_ID.utf-8')

# Fungsi filter format_rupiah


@app.template_filter('format_rupiah')
def format_rupiah(value):
    return locale.currency(value, grouping=True)


ALLOWED_EXTENSIONS = {'jpg', 'jpeg', 'png'}
UPLOAD_FOLDER = os.path.join('web', 'static', 'uploads')
GET_FOTO = os.path.join('static', 'uploads')

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '12'
app.config['MYSQL_DB'] = 'mydb'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['GET_FOTO'] = GET_FOTO
mysql = MySQL(app)

FORMAT = '%Y-%m-%d %H:%M:%S'


def check_date(in_date):
    return datetime.now() < in_date


def get_total_rent(s, e):
    print(s)
    start = time.mktime(time.strptime(s, FORMAT))
    end = time.mktime(time.strptime(e, FORMAT))
    return (end - start)/60



class AddCarForm(Form):
    nomor_plat = StringField('Nomor Plat', [validators.Length(min=3, max=10)])
    merk = SelectField('Merk', choices=[('Pilih Merk', 'Pilih Merk'), ('Toyota', 'Toyota'), ('Daihatsu', 'Daihatsu'), (
        'Honda', 'Honda'), ('Mitsubishi', 'Mitsubishi'), ('Suzuki', 'Suzuki'), ('Hyundai', 'Hyundai'), ('Isuzu', 'Isuzu'), ('Lainnya', 'Lainnya')], render_kw={"class": "select1"})
    jenis = SelectField('Jenis', choices=[
        ('Pilih Jenis', 'Pilih Jenis'),
        ('Sedan', 'Sedan'),
        ('SUV', 'Sport Utility Vehicle'),
        ('MPV', 'Multi-Purpose Vehicle'),
        ('Hatchback', 'Hatchback'),
        ('City Car', 'City Car'),
        ('Pickup', 'Pickup'),
        ('Coupe', 'Coupe'),
        ('Cabriolet/Convertible', 'Cabriolet/Convertible'),
        ('Mobil Listrik', 'Mobil Listrik'),
        ('Mobil Hibrida', 'Mobil Hibrida'),
        ('Lainnya', 'Lainnya')], render_kw={"class": "select2"})
    model = StringField('Model')
    jumlah_penumpang = SelectField('Jumlah Penumpang', choices=[('Jumlah Penumpang', 'Jumlah Penumpang'), (
        '2', '2'), ('3', '3'), ('4', '4'), ('5', '5'), ('6', '6'), ('7', '7'), ('8', '8'), ('Lainnya', 'Lainnya')], render_kw={"class": "select2"})
    tahun = StringField('Tahun Produksi')
    nomor_telepon = StringField('Nomor Telepon')
    harga_sewa = FloatField('Harga Sewa per Hari')
    lokasi = StringField('Lokasi')
    foto_mobil = FileField('Foto Mobil')


class BuatPemesananForm(Form):
    fromdate = DateTimeLocalField('Tanggal dan Waktu Sewa')
    todate = DateTimeLocalField('Tanggal dan Waktu Kembali')
    total_biaya = FloatField('Total Biaya')


class RegisterForm(Form):
    firstname = StringField('First Name', [validators.Length(min=2, max=45)])
    lastname = StringField('Last Name', [validators.Length(min=2, max=45)])
    email = StringField('Email', [validators.Length(min=6, max=100)])
    username = StringField('Username', [validators.Length(min=2, max=20)])
    password = PasswordField('Password', [validators.DataRequired(
    ), validators.EqualTo('confirm', message='Passwords do not match')])
    confirm = PasswordField('Confirm Password')


# Fahmi

def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)
        else:
            flash('Unauthorized, Please login', 'danger')
            return redirect(url_for('login'))
    return wrap


@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        firstname = form.firstname.data
        lastname = form.lastname.data
        email = form.email.data
        username = form.username.data
        password = str(form.password.data)

        cur = mysql.connection.cursor()
        cur.execute("""INSERT INTO Customer(email, lastName, firstName) VALUES('{}', '{}', '{}')""".format(
            email, lastname, firstname))
        cur.execute("""INSERT INTO User(userName, password, isVIP, Customer_email) VALUES('{}', '{}', 0, '{}')""".format(
            username, password, email))
        mysql.connection.commit()
        cur.close()
        flash('Your are now registered and can log in', 'success')
        return redirect(url_for('login'))
    return render_template('register.html', form=form)


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password_candidate = request.form['password']
        cur = mysql.connection.cursor()
        result = cur.execute(
            """SELECT * FROM User WHERE userName='{}'""".format(username))

        if result > 0:
            data = cur.fetchone()
            password = data['password']

            if password_candidate == password:
                session['logged_in'] = True
                session['username'] = username
                flash("You are now logged in", "success")
                if username == 'admin':
                    session['is_admin'] = True
                    return redirect(url_for('car'))
                else:
                    session['is_admin'] = False
                    return redirect(url_for('index'))
            else:
                flash("Invalid Login", "danger")
                return render_template('login.html')
        else:
            flash("Username not found", "danger")
            return render_template('login.html')
        cur.close()
    return render_template('login.html')


@app.route('/logout')
@is_logged_in
def logout():
    session.clear()
    flash('You are now logged out', 'success')
    return redirect(url_for('login'))


# Dicky

@app.route('/static/uploads/<filename>')
def get_foto(filename):
    return send_from_directory(app.config['GET_FOTO'], filename)


@app.route('/static/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.route('/add_car', methods=['GET', 'POST'])
@is_logged_in
def add_car():
    form = AddCarForm(request.form)
    if request.method == 'POST':
        if request.form['submit'] == 'Cancel':
            return redirect(url_for('car'))
        elif request.form['submit'] == 'Add' and form.validate():
            nomor_plat = form.nomor_plat.data
            merk = form.merk.data
            jenis = form.jenis.data
            model = form.model.data
            jumlah_penumpang = form.jumlah_penumpang.data
            tahun = form.tahun.data
            nomor_telepon = form.nomor_telepon.data
            harga_sewa = form.harga_sewa.data
            lokasi = form.lokasi.data
            foto_mobil = form.foto_mobil.data
            username = session.get('username')  # Ambil username dari sesi
            cur = mysql.connection.cursor()

            # Periksa apakah nomor plat sudah ada di database
            result = cur.execute(
                "SELECT * FROM mobil WHERE nomor_plat = %s", (nomor_plat,))
            if result > 0:
                flash(
                    'Duplicate entry. Car with the same plate number already exists.', 'danger')
            else:
                # Tangani pengunggahan file
                if 'foto_mobil' in request.files:
                    foto_mobil = request.files['foto_mobil']
                    if foto_mobil and allowed_file(foto_mobil.filename):
                        filename = secure_filename(foto_mobil.filename)
                        file_path = os.path.join(
                            app.config['UPLOAD_FOLDER'], filename)
                        foto_mobil.save(file_path)

                        # Simpan nama file foto dalam sesi atau formulir (sesuai kebutuhan)
                        session['car_photo'] = filename

                # Nomor plat belum ada, jalankan query INSERT
                cur.execute("""
                    INSERT INTO mobil 
                    VALUES(%s, 1, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                    """, (nomor_plat, merk, jenis, model, jumlah_penumpang, tahun, nomor_telepon, harga_sewa, lokasi, filename, username))
                mysql.connection.commit()
            return redirect(url_for('car'))
            cur.close()

    return render_template('add_car.html', form=form)


@app.route('/car', methods=['GET', 'POST'])
@is_logged_in
def car():
    if request.method == 'POST':
        if request.form.get('action') == 'Selesai':
            # Ambil nomor plat dari formulir jika tersedia
            nomor_plat = request.form.get('nomor_plat')
            if nomor_plat:
                cur = mysql.connection.cursor()
                try:
                    # Update status mobil menjadi tersedia
                    cur.execute(
                        "UPDATE mobil SET isAvailable = 1 WHERE nomor_plat = %s", (nomor_plat,))
                    mysql.connection.commit()
                except Exception as e:
                    error = str(e)
                    return render_template('error.html', error=error)
                finally:
                    cur.close()

    username = session.get('username')
    cur = mysql.connection.cursor()
    # Ambil mobil dengan isAvailable 0 atau 1
    result = cur.execute(
        "SELECT * FROM mobil WHERE milik_username = %s AND isAvailable IN (0, 1)", (username,))
    if result > 0:
        res = cur.fetchall()
        return render_template('my_car.html', truc=res)
    else:
        error = 'No Car found'
        return render_template('my_car.html', error=error)
    cur.close()


@app.route('/edit_car/<string:id>', methods=['GET', 'POST'])
@is_logged_in
def edit_car(id):
    form = AddCarForm(request.form)

    if request.method == 'POST':
        if request.form['submit'] == 'Cancel':
            return redirect(url_for('car'))
        elif request.form['submit'] == 'Edit':
            merk = form.merk.data
            jenis = form.jenis.data
            model = form.model.data
            jumlah_penumpang = form.jumlah_penumpang.data
            tahun = form.tahun.data
            nomor_telepon = form.nomor_telepon.data
            harga_sewa = form.harga_sewa.data
            lokasi = form.lokasi.data

            cur = mysql.connection.cursor()
            cur.execute("""
                UPDATE mobil 
                SET merk='{}', jenis='{}', model='{}', jumlah_penumpang='{}', tahun='{}', nomor_telepon='{}', harga_sewa='{}', lokasi='{}'
                WHERE nomor_plat='{}'
                """.format(merk, jenis, model, jumlah_penumpang, tahun, nomor_telepon, harga_sewa, lokasi, id))

            mysql.connection.commit()
            cur.close()
            flash('Mobil berplat {} has been updated'.format(id), 'success')
            return redirect(url_for('car'))

    # Jika request bukan POST, mungkin Anda ingin mengisi formulir dengan data yang ada dalam database
    # Ini akan membantu pengguna melihat nilai saat ini sebelum melakukan perubahan.
    cur = mysql.connection.cursor()
    result = cur.execute(
        """SELECT * FROM mobil WHERE nomor_plat = %s""", (id,))

    if result > 0:
        car_data = cur.fetchone()
        form.merk.data = car_data['merk']
        form.jenis.data = car_data['jenis']
        form.model.data = car_data['model']
        form.jumlah_penumpang.data = car_data['jumlah_penumpang']
        form.tahun.data = car_data['tahun']
        form.nomor_telepon.data = car_data['nomor_telepon']
        form.harga_sewa.data = car_data['harga_sewa']
        form.lokasi.data = car_data['lokasi']

    return render_template('edit_car.html', form=form)


@app.route('/delete_car/<string:id>', methods=['POST'])
@is_logged_in
def delete_car(id):
    print("Received request to delete car with id:", id)

    if request.method == 'POST':
        cur = mysql.connection.cursor()

        # Ambil nomor plat dari formulir jika tersedia
        nomor_plat = request.form.get('nomor_plat')

        if nomor_plat:
            try:
                # Hapus mobil berdasarkan nomor plat
                cur.execute(
                    "DELETE FROM mobil WHERE nomor_plat = %s", (nomor_plat,))
                mysql.connection.commit()

                # Hapus foto terkait
                cur.execute(
                    "SELECT foto_mobil FROM mobil WHERE nomor_plat = %s", (nomor_plat,))
                result = cur.fetchone()

                if result:
                    foto_filename = result['foto_mobil']
                    foto_filepath = os.path.join(
                        app.config['UPLOAD_FOLDER'], foto_filename)

                    if os.path.exists(foto_filepath):
                        os.remove(foto_filepath)

                flash('Mobil dengan nomor plat {} telah dihapus'.format(
                    nomor_plat), 'success')

            except Exception as e:
                error = str(e)
                return render_template('error.html', error=error)

            finally:
                cur.close()

    return redirect(url_for('car'))


@app.route('/all_car')
def all_car():
    # Ambil informasi pengguna dari sesi
    current_user = session.get('username')

    # Kueri untuk mengambil semua mobil yang tersedia kecuali mobil yang dimiliki oleh pengguna saat ini
    cur = mysql.connection.cursor()
    cur.execute(
        "SELECT * FROM mobil WHERE isAvailable = 1 AND milik_username != %s", (current_user,))
    mobil_data = cur.fetchall()
    cur.close()

    # Mengirimkan data mobil ke template
    return render_template('all_car.html', mobil_data=mobil_data)


@app.route('/buat_sewa', methods=['GET', 'POST'])
@is_logged_in
def buat_sewa():
    form = BuatPemesananForm(request.form)

    # Ambil nomor plat dari formulir jika tersedia
    nomor_plat = request.args.get('nomor_plat')

    if request.method == 'POST':
        if request.form['submit'] == 'Cancel':
            return redirect(url_for('all_car'))
        elif request.form['submit'] == 'Sewa' and form.validate():
            fromdate = form.fromdate.data
            todate = form.todate.data
            cur = mysql.connection.cursor()
            result = cur.execute("SELECT * FROM mobil WHERE isAvailable=1")
            if result > 0:
                mobil_data = cur.fetchall()
                for data in mobil_data:
                    username = session['username']
                    nomor_plat = data['nomor_plat']
                    tarif_sewa = data['harga_sewa']
                    lama_sewa = (todate - fromdate).days
                    total_biaya = lama_sewa * tarif_sewa

                    # Tambahkan baris berikut untuk mendapatkan pemilik dari tabel mobil
                    cur.execute(
                        "SELECT milik_username FROM mobil WHERE nomor_plat = %s", (nomor_plat,))
                    pemilik = cur.fetchone()['milik_username']

                    # Generate ID Sewa dengan angka dan huruf kapital acak
                    id_sewa = ''.join(secrets.choice(
                        string.ascii_uppercase + string.digits) for _ in range(8))

                # Update database
                try:
                    cur.execute("""
                        INSERT INTO penyewaan (id_sewa, id_penyewa, nomor_plat, pemilik, fromdate, todate, tarif_sewa, total_hari, total_biaya)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                    """, (id_sewa, username, nomor_plat, pemilik, fromdate, todate, tarif_sewa, lama_sewa, total_biaya))

                    mysql.connection.commit()
                except Exception as e:
                    error = str(e)
                    return render_template('error.html', error=error)

                # Simpan data di sesi
                session['id_sewa'] = id_sewa
                session['id_penyewa'] = username
                session['nomor_plat'] = nomor_plat
                session['fromdate'] = fromdate
                session['todate'] = todate
                session['tarif_sewa'] = tarif_sewa
                session['total_biaya'] = total_biaya
                session['lama_sewa'] = lama_sewa

                return redirect(url_for('konfirmasi'))
            else:
                error = 'Car is not available in this location'
                return render_template('buat_sewa.html', error=error, form=form)
                cur.close()

    return render_template('buat_sewa.html', form=form)


@app.route('/konfirmasi')
@is_logged_in
def konfirmasi():
    if 'id_sewa' in session and 'id_penyewa' in session and 'nomor_plat' in session and 'fromdate' in session and 'todate' in session and 'total_biaya' in session and 'lama_sewa' in session:
        id_sewa = session['id_sewa']
        id_penyewa = session['id_penyewa']
        nomor_plat = session['nomor_plat']
        fromdate = session['fromdate']
        todate = session['todate']
        lama_sewa = session['lama_sewa']
        total_biaya = session['total_biaya']

        # Mengambil informasi mobil dari basis data
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM mobil WHERE nomor_plat = %s", (nomor_plat,))
        mobil_data = cur.fetchone()
        cur.close()

        if mobil_data:
            # Menambahkan informasi mobil ke dalam data yang dikirimkan ke template
            mobil_info = {
                'nomor_plat': mobil_data['nomor_plat'],
                'merk': mobil_data['merk'],
                'jenis': mobil_data['jenis'],
                'model': mobil_data['model'],
                'jumlah_penumpang': mobil_data['jumlah_penumpang'],
                'tahun': mobil_data['tahun'],
                'nomor_telepon': mobil_data['nomor_telepon'],
                'harga_sewa': mobil_data['harga_sewa'],
                'lokasi': mobil_data['lokasi'],

                # ... tambahkan informasi mobil lainnya yang ingin Anda tampilkan
            }

            return render_template('konfirmasi.html', id_sewa=id_sewa, id_penyewa=id_penyewa, nomor_plat=nomor_plat,
                                   fromdate=fromdate, todate=todate, lama_sewa=lama_sewa, total_biaya=total_biaya, mobil_info=mobil_info)
        else:
            error = 'Car information not found in the database.'
            return render_template('buat_sewa.html', error=error)
    else:
        error = 'Session data is incomplete. Please go back and fill the form again.'
        return render_template('buat_sewa.html', error=error)


@app.route('/cek_sewa')
@is_logged_in
def cek_sewa():
    username = session.get('username')
    cur = mysql.connection.cursor()

    # Ambil data penyewaan dan ketersediaan mobil menggunakan JOIN
    cur.execute("""
        SELECT penyewaan.*, mobil.isAvailable
        FROM penyewaan
        JOIN mobil ON penyewaan.nomor_plat = mobil.nomor_plat
        WHERE penyewaan.id_penyewa = %s
    """, (username,))

    data = cur.fetchall()
    cur.close()

    return render_template('cek_sewa.html', truc=data)


@app.route('/complete_booking/<string:id_sewa>')
@is_logged_in
def complete_booking(id_sewa):
    cur = mysql.connection.cursor()

    try:
        # Update status pemesanan menjadi selesai
        cur.execute("""
            UPDATE penyewaan AS p
            JOIN mobil AS m ON p.nomor_plat = m.nomor_plat
            SET m.isAvailable = 1
            WHERE p.id_sewa = %s
        """, (id_sewa,))

        mysql.connection.commit()

        return redirect(url_for('cek_sewa'))

    except Exception as e:
        # Handle exceptions, log errors, etc.
        print(f"Error: {str(e)}")
        mysql.connection.rollback()

    finally:
        cur.close()


@app.route('/cancel_booking/<string:id_sewa>', methods=['GET', 'POST'])
@is_logged_in
def cancel_booking(id_sewa):
    if request.method == 'POST':
        # Handle POST request (if needed)
        pass
    else:
        nomor_plat = None  # Inisialisasi nomor_plat
        cur = mysql.connection.cursor()

        # Ambil nomor_plat dari tabel penyewaan sebelum dihapus
        cur.execute(
            "SELECT nomor_plat FROM penyewaan WHERE id_sewa = %s", (id_sewa,))
        result = cur.fetchone()
        if result:
            nomor_plat = result['nomor_plat']

        # Hapus pemesanan sewa
        cur.execute("DELETE FROM penyewaan WHERE id_sewa = %s", (id_sewa,))
        mysql.connection.commit()

        if nomor_plat:
            # Set isAvailable menjadi 1 setelah pemesanan dibatalkan
            cur.execute(
                "UPDATE mobil SET isAvailable = 1 WHERE nomor_plat = %s", (nomor_plat,))
            mysql.connection.commit()

        cur.close()

        return redirect(url_for('cek_sewa'))


@app.route('/car_details/<string:nomor_plat>')
@is_logged_in
def car_details(nomor_plat):
    cur = mysql.connection.cursor()
    result = cur.execute(
        """SELECT * FROM mobil WHERE nomor_plat = %s""", (nomor_plat,))
    if result > 0:
        # Ambil data mobil dari hasil eksekusi query
        mobil_data = cur.fetchone()
        # Kirim data mobil ke template untuk ditampilkan
        return render_template('car_details.html', mobil_data=mobil_data)
    else:
        error = 'No Car found'
        return render_template('car_details.html', error=error)
    cur.close()


@app.route('/car_detail/<string:nomor_plat>')
@is_logged_in
def car_detail(nomor_plat):
    cur = mysql.connection.cursor()
    result = cur.execute(
        """SELECT * FROM mobil WHERE nomor_plat = %s""", (nomor_plat,))
    if result > 0:
        item = cur.fetchall()
        return render_template('rincian_mobil.html', item=item)
    else:
        error = 'No Car found'
        return render_template('rincian_mobil.html', error=error)
    cur.close()


@app.route('/penyewaan')
@is_logged_in
def penyewaan():
    cur = mysql.connection.cursor()
    result = cur.execute(
        """SELECT * FROM penyewaan WHERE id_penyewa='{}'""".format(session['username']))
    if result > 0:
        res = cur.fetchall()
        for i in range(len(res)):
            res[i]['rm'], res[i]['value'] = (
                'DELETE', 'btn btn-danger') if check_date(res[i]['fromdate']) else ('DONE', 'btn btn-basic')
        return render_template('penyewaan.html', res=res)
    else:
        error = 'No Reservation found'
        return render_template('penyewaan.html', error=error)
    cur.close()


@app.route('/konfirmasi_sewa', methods=['POST'])
@is_logged_in
def konfirmasi_sewa():
    nomor_plat = request.form.get('nomor_plat')

    # Update status mobil menjadi tidak tersedia
    cur = mysql.connection.cursor()
    cur.execute(
        "UPDATE mobil SET isAvailable = 0 WHERE nomor_plat = %s", (nomor_plat,))
    mysql.connection.commit()
    cur.close()

    return redirect(url_for('konfirmasi_sukses'))


@app.route('/konfirmasi_sukses')
@is_logged_in
def konfirmasi_sukses():
    return render_template('konfirmasi_sukses.html')


@app.route('/')
def index():
    cur = mysql.connection.cursor()
    result = cur.execute("SELECT * FROM Reservation")
    data = cur.fetchall()
    print(data[1])
    print(check_date(data[1]['fromDate']))
    cur.close()
    return render_template('home.html')


@app.route('/about')
def about():
    return render_template('about.html')

if __name__ == '__main__':
    app.secret_key = '12'
    app.run(debug=True)