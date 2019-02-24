# Generated by Django 2.1.7 on 2019-02-24 14:21

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_auto_20190224_1417'),
    ]

    operations = [
        migrations.AlterField(
            model_name='video',
            name='userId',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='uploader', to=settings.AUTH_USER_MODEL, to_field='publisherId'),
        ),
    ]
