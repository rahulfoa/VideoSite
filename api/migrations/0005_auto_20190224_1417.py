# Generated by Django 2.1.7 on 2019-02-24 14:17

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_auto_20190224_1416'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='publisheriD',
            new_name='publisherId',
        ),
        migrations.AlterField(
            model_name='video',
            name='userId',
            field=models.ForeignKey(db_column='publisherId', on_delete=django.db.models.deletion.CASCADE, related_name='uploader', to=settings.AUTH_USER_MODEL),
        ),
    ]
