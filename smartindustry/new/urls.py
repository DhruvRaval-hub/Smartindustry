from . import views
from django.urls import path

urlpatterns = [
    path('', views.index, name='index'),
    path('checkuser', views.checkuser, name='checkuser'),
    path('checkuser1', views.checkuser1, name='checkuser1'),
    path('adduser', views.adduser, name='adduser'),
    path('admin', views.admin, name='admin'),
    path('dashboard', views.dashboard, name='dashboard'),
    path('smoke', views.smoke, name='smoke'),
    path('flame', views.flame, name='flame'),
    path('ir', views.ir, name='ir'),
    path('ldr', views.ldr, name='ldr'),
    path('pir', views.pir, name='pir'),
    path('soil', views.soil, name='soil'),
    path('temp', views.temp, name='temp'),
    path('ultrasonic', views.ultrasonic, name='ultrasonic'),
    path('detail', views.detail, name='detail'),
    path('rfid', views.rfid, name='rfid'),
    path('addrfid', views.addrfid, name='rfid'),
    path('attendance',views.attendance,name='attendance'),
    path('password',views.password,name='password'),
    path('validate',views.otpvalidate,name='validate'),
]