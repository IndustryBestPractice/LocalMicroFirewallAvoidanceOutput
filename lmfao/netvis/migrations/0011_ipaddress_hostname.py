# Generated by Django 4.0 on 2022-01-20 04:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('netvis', '0010_alter_events_dst_ip_id_alter_events_src_ip_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='ipaddress',
            name='hostname',
            field=models.CharField(blank=True, max_length=100),
        ),
    ]
