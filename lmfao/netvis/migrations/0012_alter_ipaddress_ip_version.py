# Generated by Django 4.0 on 2022-01-20 04:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('netvis', '0011_ipaddress_hostname'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ipaddress',
            name='ip_version',
            field=models.CharField(default='ipv4', max_length=4),
        ),
    ]
