# Generated by Django 4.2.9 on 2024-01-29 18:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quiz', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('description', models.TextField()),
                ('color', models.CharField(default='#007bff', max_length=7)),
            ],
        ),
        migrations.AddField(
            model_name='quiz',
            name='categories',
            field=models.ManyToManyField(related_name='quizzes', to='quiz.category'),
        ),
    ]