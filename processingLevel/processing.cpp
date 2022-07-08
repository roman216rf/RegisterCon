#include "processing.h"

Processing::Processing(): database(new RegDataBase()), registr(new RegRegistr()){

}

QPair<bool, QString> Processing::runConnectToDB(){
    return database.get()->connect(registr.get()->readValue(RegRegistr::Keys::Hostname),
                                                           registr.get()->readValue(RegRegistr::Keys::DataBaseName),
                                                           registr.get()->readValue(RegRegistr::Keys::Username),
                                                           registr.get()->readValue(RegRegistr::Keys::Password));
}
