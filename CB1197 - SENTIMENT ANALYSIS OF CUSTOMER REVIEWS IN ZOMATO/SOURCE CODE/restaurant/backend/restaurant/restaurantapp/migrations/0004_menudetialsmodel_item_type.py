# Generated by Django 4.1.1 on 2022-10-01 11:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurantapp', '0003_alter_menudetialsmodel_item_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='menudetialsmodel',
            name='item_type',
            field=models.CharField(help_text='item type', max_length=100, null=True),
        ),
    ]
