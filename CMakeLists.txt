cmake_minimum_required(VERSION 3.16)

project(gematria_calculator VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

# Content of downloaded design from Figma to Qt or similar
if (EXISTS "${CMAKE_CURRENT_LIST_DIR}/importedcontent/CMakeLists.txt")
    add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/importedcontent)
endif()

qt_add_executable(appgematria_calculator
    src/main.cpp
)

set_target_properties(appgematria_calculator PROPERTIES
   QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android"
   QT_ANDROID_PACKAGE_NAME "com.user186d45.gematriaCalculator"
   QT_ANDROID_APP_NAME "Gematria Calculator")

qt_add_qml_module(appgematria_calculator
    URI gematria_calculator
    QML_FILES
        src/qml/Main.qml
        src/qml/HebrewKabbalahPage.qml
        src/qml/TrigrammatonKabbalahPage.qml
        src/qml/GreekKabbalahPage.qml
        src/qml/AboutPage.qml
)

qt_add_resources(qrc_gematria_calculator "resources/resources.qrc")
target_sources(appgematria_calculator PRIVATE ${qrc_gematria_calculator})

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appgematria_calculator PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appgematria_calculator
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appgematria_calculator
    PRIVATE Qt6::Quick
)

install(TARGETS appgematria_calculator
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
