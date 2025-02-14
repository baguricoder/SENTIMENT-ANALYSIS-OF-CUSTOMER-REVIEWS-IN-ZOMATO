from email.policy import default
from django.db import models
import datetime
d1= datetime.datetime.now()
print(d1)
from restaurantapp.models import MenuDetialsModel

from customerapp.models import *

# Create your models here.
class CustomersDetialsModel(models.Model):
    customer_id = models.AutoField(primary_key=True)
    customer_name = models.CharField(max_length=100,help_text="customer_name")
    customer_ph_number = models.BigIntegerField()
    customer_password = models.CharField(max_length=12,help_text="custome_password",null=True)

    class Meta:
        db_table = 'customers_details'



class CustomerMyBooking(models.Model):
    booking_id = models.AutoField(primary_key=True)
    customer = models.ForeignKey(CustomersDetialsModel,models.CASCADE,null=True)
    menu_details = models.ForeignKey(MenuDetialsModel,models.CASCADE)
    status=models.CharField(max_length=50,default="Pending")
    booking_date = models.DateField(auto_now_add=True,null=True)


    class Meta:
        db_table = 'customer_booking'


class CustomerFeedBackModel(models.Model):
    feedback_id = models.AutoField(primary_key=True)
    customer = models.ForeignKey(CustomersDetialsModel,models.CASCADE,null=True)
    item = models.ForeignKey(CustomerMyBooking,models.CASCADE,null=True)
    taste_feedback = models.IntegerField(help_text="taste_feedback",null=True)
    price_feedback = models.IntegerField(help_text="price_feedback",null=True)
    service_feedback = models.IntegerField(help_text="service",null=True)
    overview = models.CharField(max_length=100,help_text="overview",null=True)
    sentiment = models.CharField(max_length=100,help_text="sentiment",null=True)

    class Meta:
        db_table = 'customer_feedback_details'        



