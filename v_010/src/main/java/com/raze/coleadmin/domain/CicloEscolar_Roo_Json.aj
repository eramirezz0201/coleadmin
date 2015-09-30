// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.domain;

import com.raze.coleadmin.domain.CicloEscolar;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CicloEscolar_Roo_Json {
    
    public String CicloEscolar.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String CicloEscolar.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static CicloEscolar CicloEscolar.fromJsonToCicloEscolar(String json) {
        return new JSONDeserializer<CicloEscolar>()
        .use(null, CicloEscolar.class).deserialize(json);
    }
    
    public static String CicloEscolar.toJsonArray(Collection<CicloEscolar> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String CicloEscolar.toJsonArray(Collection<CicloEscolar> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<CicloEscolar> CicloEscolar.fromJsonArrayToCicloEscolars(String json) {
        return new JSONDeserializer<List<CicloEscolar>>()
        .use("values", CicloEscolar.class).deserialize(json);
    }
    
}