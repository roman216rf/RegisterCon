#ifndef REGDATABASE_H
#define REGDATABASE_H

#include <QObject>

class RegDataBase
{
public:
    RegDataBase();
    QPair<bool, QString>connect(const QString& host, const QString& db_name, const QString& login, const QString& password);
};

#endif // REGDATABASE_H
