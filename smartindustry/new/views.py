import math
import smtplib
import ssl
import random

from django.contrib import messages
from django.shortcuts import render, redirect

import requests


def index(request):
    return render(request, 'index.html')

def validate(request):
    return render(request, 'validate.html')

def password(request):
    return render(request, 'password.html')

def checkuser1(request):
    if request.method == 'POST':
        email = request.POST.get("txtemail")

        url = "http://smart-industry.tech/authentication/resetemail.php"
        params = {
            "email": email,
        }
        r2 = requests.post(url=url, data=params)
        # print(r2.text)

        res = r2.json()
        ev = res['error']
        # print(res)
        print(res['details']['EMAIL_ID'])
        global otp
        otp = generateOTP()
        global check_email
        check_email = res['details']['EMAIL_ID']
        sendingMail( )
        if not ev:
            return render(request, 'validate.html', {"otp": otp, "email": check_email})
        else:
            messages.error(request, "Email Not Found!! ")
    else:

        messages.error(request, "Unable to Find Details..!!")

    return render(request, 'password.html')


def sendingMail( ):
    port = 587  # For starttls
    smtp_server = "smtp.stackmail.com"
    sender_email = "info@smart-industry.tech"
    receiver_email = check_email
    password1 = "Dhruv@1234"
    message = """\
    Subject: OTP for password reset

    This message is sent by SMART INDUSTRY SYSTEM YOUR OTP IS:   """
    message += str(otp)
    """Do not share this with anyone...!"""

    context = ssl.create_default_context()
    with smtplib.SMTP(smtp_server, port) as server:
        server.ehlo()  # Can be omitted
        server.starttls(context=context)
        server.ehlo()  # Can be omitted
        server.login(sender_email, password1)
        server.sendmail(sender_email, receiver_email, message)


def generateOTP():
    # Declare a string variable
    # which stores all string
    string = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    OTP = ""
    length = len(string)
    for i in range(6):
        OTP += string[math.floor(random.random() * length)]

    return OTP

def otpvalidate(request):
    if request.method == 'POST':
        otp1 = request.POST.get("otp")
        email = request.POST.get("txtemail")
        password = request.POST.get("txtpass")
        if otp1 == otp and check_email == email:
            url = "http://smart-industry.tech/authentication/changepassword.php"
            params = {
                "email": email,
                "password": password,

            }
            r2 = requests.post(url=url, data=params)
            print(r2.text)

            res = r2.json()
            ev = res['error']

            if not ev:

                return render(request, 'index.html')
            else:
                messages.error(request, "Invalid Email & Password !!")
        else:
            messages.error(request, "Enter Correct OTP or Email...!")

    else:

        messages.error(request, "Unable to Login..!!")

    return render(request, 'validate.html')

def checkuser(request):
    if request.method == 'POST':
        email = request.POST.get("txtemail")
        password = request.POST.get("txtpass")
        url = "http://smart-industry.tech/authentication/login.php"
        params = {
            "email": email,
            "password": password
        }
        r2 = requests.post(url=url, data=params)
        print(r2.text)

        res = r2.json()
        ev = res['error']
        print(ev)
        print(res)
         #request.session['id'] = res['user']['EMAIL_ID']
        print(res['user']['EMAIL_ID'])

        if not ev:

            return dashboard(request)
        else:
            messages.error(request, "Invalid Email & Password !! ")

    else:

        messages.error(request, "Unable to Login..!!")

    return render(request, 'index.html')


def adduser(request):
    if request.method == 'POST':
        email = request.POST.get("email")
        password = request.POST.get("password")
        phone = request.POST.get("phone")
        role = request.POST.get("role")
        url = "http://smart-industry.tech/authentication/signup.php"
        params = {
            "email": email,
            "password": password,
            "phone": phone,
            "role": role
        }
        r2 = requests.post(url=url, data=params)
        print(r2.text)

        res = r2.json()
        ev = res['error']

        if not ev:
            messages.success(request, "user added successfully!!")
            return render(request, 'admin.html')
        else:
            pass

    else:
        pass

    return render(request, 'dashboard.html')

def addrfid(request):
    if request.method == 'POST':
        email = request.POST.get("email")
        rfid = request.POST.get("rfid")
        url = "http://smart-industry.tech/authentication/rfidadd.php"
        params = {
            "email": email,
            "rfidkey": rfid
        }
        r2 = requests.post(url=url, data=params)
        print(r2.text)

        res = r2.json()
        ev = res['error']

        if not ev:
            messages.success(request, "user added successfully!!")
            return render(request, 'rfid.html')
        else:
            pass

    else:
        pass

    return render(request, 'rfid.html')


def admin(request):
    return render(request, 'admin.html')

def rfid(request):
    return render(request, 'rfid.html')


def detail(request):
    return render(request, 'detail.html')


def dashboard(request):
    records = {}
    url = "http://smart-industry.tech/authentication/dashboard.php"
    params = {
        "DEVICE_ID": "1"
    }
    r1 = requests.post(url=url, data=params)

    smoke_res = r1.json()

    ev = smoke_res['error']
    records['dataaaa'] = smoke_res

    smoke = smoke_res['smoke']
    flame = smoke_res['flame']
    ir = smoke_res['ir']
    ldr = smoke_res['ldr']
    pir = smoke_res['pir']
    soil = smoke_res['soil']
    hum = smoke_res['hum']
    temp = smoke_res['temp']
    ultrasonic = smoke_res['ultrasonic']

    context = {

        'smoke' : smoke,
        'flame' : flame,
        'ir' : ir,
        'ldr' : ldr,
        'pir' : pir,
        'soil' : soil,
        'hum' : hum,
        'temp' : temp,
        'ultrasonic' : ultrasonic,
    }


    print(records)
    print(ev)

    if ev:
        messages.error(request, smoke_res['message'])
    else:
        pass

    return render(request, 'dashboard.html' , context)


def smoke(request):
    records = {}
    url = "http://smart-industry.tech/authentication/smokedata.php"
    r1 = requests.post(url=url, data="this")

    smoke_res = r1.json()

    ev = smoke_res['error']
    records['data'] = smoke_res
    print(records)

    if ev:
        messages.error(request, smoke_res['message'])

    return render(request, 'smoke.html', records)

def attendance(request):
    records = {}
    url = "http://smart-industry.tech/authentication/attendancedata.php"
    r1 = requests.post(url=url, data="this")

    smoke_res = r1.json()

    ev = smoke_res['error']
    records['data'] = smoke_res
    print(records)

    if ev:
        messages.error(request, smoke_res['message'])

    return render(request, 'attendance.html', records)


def dashboarddata(request):
    records = {}
    url = "http://smart-industry.tech/authentication/dashboard.php"
    r1 = requests.post(url=url, data="this")

    smoke_res = r1.json()

    ev = smoke_res['error']
    records['data'] = smoke_res
    print(records)

    if ev:
        messages.error(request, smoke_res['message'])
    else:
        pass

    return render(request, 'dashboard.html', records)


def flame(request):
    records = {}
    url = "http://smart-industry.tech/authentication/flamedata.php"
    r1 = requests.post(url=url, data="this")

    flame_res = r1.json()

    ev = flame_res['error']
    records['data'] = flame_res
    print(records)

    if ev:
        messages.error(request, flame_res['message'])

    return render(request, 'flame.html', records)


def ir(request):
    records = {}
    url = "http://smart-industry.tech/authentication/irdata.php"
    r1 = requests.post(url=url, data="this")

    ir_res = r1.json()

    ev = ir_res['error']
    records['data'] = ir_res
    print(records)

    if ev:
        messages.error(request, ir_res['message'])

    return render(request, 'ir.html', records)


def ldr(request):
    records = {}
    url = "http://smart-industry.tech/authentication/ldrdata.php"
    r1 = requests.post(url=url, data="this")

    ldr_res = r1.json()

    ev = ldr_res['error']
    records['data'] = ldr_res
    print(records)

    if ev:
        messages.error(request, ldr_res['message'])

    return render(request, 'ldr.html', records)


def pir(request):
    records = {}
    url = "http://smart-industry.tech/authentication/pirdata.php"
    r1 = requests.post(url=url, data="this")

    pir_res = r1.json()

    ev = pir_res['error']
    records['data'] = pir_res
    print(records)

    if ev:
        messages.error(request, pir_res['message'])

    return render(request, 'pir.html', records)


def soil(request):
    records = {}
    url = "http://smart-industry.tech/authentication/soildata.php"
    r1 = requests.post(url=url, data="this")

    soil_res = r1.json()

    ev = soil_res['error']
    records['data'] = soil_res
    print(records)

    if ev:
        messages.error(request, soil_res['message'])

    return render(request, 'soil.html', records)


def temp(request):
    records = {}
    url = "http://smart-industry.tech/authentication/tempdata.php"
    r1 = requests.post(url=url, data="this")

    temp_res = r1.json()

    ev = temp_res['error']
    records['data'] = temp_res
    print(records)

    if ev:
        messages.error(request, temp_res['message'])

    return render(request, 'temp.html', records)


def ultrasonic(request):
    records = {}
    url = "http://smart-industry.tech/authentication/ultrasonicdata.php"
    r1 = requests.post(url=url, data="this")

    ultrasonic_res = r1.json()

    ev = ultrasonic_res['error']
    records['data'] = ultrasonic_res
    print(records)

    if ev:
        messages.error(request, ultrasonic_res['message'])

    return render(request, 'ultrasonic.html', records)
