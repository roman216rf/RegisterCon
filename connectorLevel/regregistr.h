#ifndef REGREGISTR_H
#define REGREGISTR_H
#include <QObject>

class RegRegistr{
    Q_OBJECT

public:
    enum Keys{Hostname, DataBaseName, Username, Password} keys;
    Q_ENUM(Keys)

    RegRegistr();
    QString readValue(const Keys& key);
    void writeValue(const Keys& key, const QString& value);
};

#endif // REGREGISTR_H
