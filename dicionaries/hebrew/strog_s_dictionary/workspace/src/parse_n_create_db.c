#include <stdio.h>
#include <sqlite3.h>
#include <cjson/cJSON.h>

#include "../include/jsonValidation.h"

int main() {
    char rawJson[1024 * 1024 * 5];

    FILE* fp = fopen("../raw/strongs-hebrew-dictionary.json", "r");

    fread(rawJson, sizeof(char), sizeof(rawJson), fp);

    if (!feof(fp)) {
        fprintf(stderr, "didn't reach end of file\n");

        fclose(fp);

        return 1;

    }
    fclose(fp);

    if (!__isJsonValid(rawJson)) {
        fprintf(stderr, "provied json is not valid\n");

        return 1;

    }

    cJSON* json = cJSON_Parse(rawJson);

    sqlite3* db;
    int rc = sqlite3_open("strong_s_dictionary.db", &db);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "failed to open db\n");

        cJSON_Delete(json);

        return 1;

    }

    const char* createDbCmd = "CREATE TABLE IF NOT EXISTS dictionary( "
                              "ID TEXT PRIMARY KEY NOT NULL, "
                              "lemma TEXT DEFAULT NULL, "
                              "xlit TEXT DEFAULT NULL, "
                              "pron TEXT DEFAULT NULL, "
                              "derivation TEXT DEFAULT NULL, "
                              "strongs_def TEXT DEFAULT NULL, "
                              "kjv_def TEXT DEFAULT NULL);";

    rc = sqlite3_exec(db, createDbCmd, NULL, NULL, NULL);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "create table execution failed\n");

        sqlite3_close(db);

        return 1;

    }

    const char* insertSql = "INSERT INTO dictionary("
                            "ID, "
                            "lemma, "
                            "xlit, "
                            "pron, "
                            "derivation, "
                            "strongs_def, "
                            "kjv_def) "
                            "VALUES ( ?, ?, ?, ?, ?, ?, ?);";

    sqlite3_stmt* stmt;
    rc = sqlite3_prepare_v2(db, insertSql, -1, &stmt, NULL);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "failed to prepare the sql statement\n");

        sqlite3_close(db);

        return 1;

    }

    for (int i = 1; i < 8675; i++) {
        char itemName[32];
        snprintf(itemName, sizeof(itemName), "H%i", i);
        if (!cJSON_HasObjectItem(json, itemName)) {
            fprintf(stderr, "H%i doesn't exist\n", i);

        } else {
            cJSON* itemObj = cJSON_GetObjectItem(json, itemName);

            if (cJSON_HasObjectItem(itemObj, itemName)) {
                sqlite3_bind_text(stmt, 1, cJSON_GetObjectItem(itemObj, itemName)->valuestring, -1, SQLITE_STATIC);

            }

            if (cJSON_HasObjectItem(itemObj, "lemma")) {
                sqlite3_bind_text(stmt, 2, cJSON_GetObjectItem(itemObj, "lemma")->valuestring, -1, SQLITE_STATIC);

            }

            if (cJSON_HasObjectItem(itemObj, "xlit")) {
                sqlite3_bind_text(stmt, 3, cJSON_GetObjectItem(itemObj, "xlit")->valuestring, -1, SQLITE_STATIC);

            }

            if (cJSON_HasObjectItem(itemObj, "pron")) {
                sqlite3_bind_text(stmt, 4, cJSON_GetObjectItem(itemObj, "pron")->valuestring, -1, SQLITE_STATIC);

            }

            if (cJSON_HasObjectItem(itemObj, "derivation")) {
                sqlite3_bind_text(stmt, 5, cJSON_GetObjectItem(itemObj, "derivation")->valuestring, -1, SQLITE_STATIC);

            }

            if (cJSON_HasObjectItem(itemObj, "strongs_def")) {
                sqlite3_bind_text(stmt, 6, cJSON_GetObjectItem(itemObj, "strongs_def")->valuestring, -1, SQLITE_STATIC);

            }

            if (cJSON_HasObjectItem(itemObj, "kjv_def")) {
                sqlite3_bind_text(stmt, 7, cJSON_GetObjectItem(itemObj, "kjv_def")->valuestring, -1, SQLITE_STATIC);

            }

        }

    }

    return 0;

}
