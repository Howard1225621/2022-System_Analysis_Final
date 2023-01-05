from django.db import models

# Create your models here.

class TblAdministrator(models.Model):
    id_administrator = models.AutoField(primary_key=True)
    account = models.CharField(max_length=45)
    password = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'tbl_administrator'


class TblAttraction(models.Model):
    id_attraction = models.AutoField(primary_key=True)
    id_city_a = models.ForeignKey('TblCity', models.DO_NOTHING, db_column='id_city_a')
    name = models.CharField(max_length=45)
    detail = models.CharField(max_length=2000)
    picture = models.CharField(max_length=2000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_attraction'


class TblCity(models.Model):
    id_city = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'tbl_city'


class TblMember(models.Model):
    id_member = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    gmail = models.CharField(max_length=45)
    create_time = models.DateTimeField()
    password = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'tbl_member'


class TblProject(models.Model):
    id_project = models.AutoField(primary_key=True)
    id_member_project = models.ForeignKey(TblMember, models.DO_NOTHING, db_column='id_member_project')
    name = models.CharField(max_length=45)
    create_time = models.DateTimeField()
    modify_time = models.DateTimeField(blank=True, null=True)
    start_time = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_project'


class TblProjectAttraction(models.Model):
    id_project_pa = models.ForeignKey(TblProject, models.DO_NOTHING, db_column='id_project_pa')     
    id_attraction_pa = models.ForeignKey(TblAttraction, models.DO_NOTHING, db_column='id_attraction_pa')
    time = models.TimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_project_attraction'