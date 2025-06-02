cmake_minimum_required(VERSION 3.16)

project(xcmd-qt VERSION 0.1 LANGUAGES CXX)


find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

qt_standard_project_setup()


qt_add_executable(appxcmd-qt
    resources.qrc
    src/main.cpp
)

qt_add_qml_module(appxcmd-qt
    URI xcmd-qt
    VERSION 1.0
    QML_FILES
        src/Main.qml
        src/TextPart.qml
        src/HexagonPart.qml
)

set_target_properties(appxcmd-qt PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appxcmd-qt
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appxcmd-qt
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

