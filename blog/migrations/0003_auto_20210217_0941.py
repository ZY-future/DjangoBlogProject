# Generated by Django 2.2 on 2021-02-17 01:41

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_auto_20210216_2025'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='blog',
            options={'ordering': ['-create_time']},
        ),
    ]