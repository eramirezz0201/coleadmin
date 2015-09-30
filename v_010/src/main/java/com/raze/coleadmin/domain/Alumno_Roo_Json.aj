// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.domain;

import com.raze.coleadmin.domain.Alumno;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Alumno_Roo_Json {
    
    public String Alumno.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String Alumno.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Alumno Alumno.fromJsonToAlumno(String json) {
        return new JSONDeserializer<Alumno>()
        .use(null, Alumno.class).deserialize(json);
    }
    
    public static String Alumno.toJsonArray(Collection<Alumno> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String Alumno.toJsonArray(Collection<Alumno> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Alumno> Alumno.fromJsonArrayToAlumnoes(String json) {
        return new JSONDeserializer<List<Alumno>>()
        .use("values", Alumno.class).deserialize(json);
    }
    
}