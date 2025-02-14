from email.policy import default
from django.db import models

# Create your models here.

# python class

class MenuDetialsModel(models.Model):
    item_id = models.AutoField(primary_key=True)
    item_name = models.CharField(max_length=100,help_text="item name")
    item_price = models.IntegerField(help_text="price")
    item_offer_zone = models.CharField(max_length=100,help_text="offer zone")
    item_description = models.TextField(help_text="description",max_length=500) 
    item_image = models.FileField(upload_to= 'images',null=True)
    item_type = models.CharField(max_length=100,help_text="item type",null=True)
   

    
    class Meta:
        db_table = 'menu_details'
        
