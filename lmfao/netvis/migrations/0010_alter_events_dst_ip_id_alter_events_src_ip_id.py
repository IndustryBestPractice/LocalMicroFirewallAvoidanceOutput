# Generated by Django 4.0 on 2022-01-18 05:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('netvis', '0009_rename_transaction_events_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='events',
            name='dst_ip_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='dst_ip_id', to='netvis.ipaddress'),
        ),
        migrations.AlterField(
            model_name='events',
            name='src_ip_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='src_ip_id', to='netvis.ipaddress'),
        ),
    ]
