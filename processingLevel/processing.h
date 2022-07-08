#ifndef PROCESSING_H
#define PROCESSING_H

#include <QObject>
#include <connectorLevel/regdatabase.h>
#include <connectorLevel/regregistr.h>

class Processing: public QObject{
    Q_OBJECT
public:
    explicit Processing();
    QPair<bool, QString> runConnectToDB();

private:
    QScopedPointer<RegDataBase> database;
    QScopedPointer<RegRegistr> registr;
};

#endif // PROCESSING_H
