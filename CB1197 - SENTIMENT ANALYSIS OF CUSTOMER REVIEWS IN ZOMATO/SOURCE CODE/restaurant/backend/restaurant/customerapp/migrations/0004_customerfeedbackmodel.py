# Generated by Django 4.1.1 on 2022-09-30 10:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customerapp', '0003_alter_customersdetialsmodel_customer_ph_number'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomerFeedBackModel',
            fields=[
                ('feedback_id', models.AutoField(primary_key=True, serialize=False)),
                ('taste_feedback', models.IntegerField(help_text='taste_feedback', null=True)),
                ('price_feedback', models.IntegerField(help_text='price_feedback', null=True)),
                ('service_feedback', models.IntegerField(help_text='service', null=True)),
                ('overview', models.CharField(help_text='overview', max_length=100, null=True)),
                ('sentiment', models.CharField(help_text='sentiment', max_length=100, null=True)),
            ],
            options={
                'db_table': 'customer_feedback_details',
            },
        ),
    ]
