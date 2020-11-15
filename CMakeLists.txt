cmake_minimum_required(VERSION 3.0...3.16)

project(toxic VERSION 0.9.0 LANGUAGES C)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

find_package(Threads REQUIRED)
find_package(toxcore REQUIRED)
set(CURSES_NEED_NCURSES TRUE)
set(CURSES_NEED_WIDE TRUE)
find_package(Curses REQUIRED)
find_package(CURL REQUIRED)
find_package(libconfig REQUIRED)

find_package(OpenAL)
find_package(X11)

find_library(MATH_LIBRARY m) # CMake doesn't really care for libm. :(

add_executable(${PROJECT_NAME}
    $<$<BOOL:${OpenAL_FOUND}>:
        src/audio_call.c;
        src/audio_device.c;
    >
    $<$<BOOL:${X11_FOUND}>:
        src/xtra.c;
    >
    src/friendlist.c
    src/api.c
    src/autocomplete.c
    src/avatars.c
    src/bootstrap.c
    src/chat.c
    src/chat_commands.c
    src/conference.c
    src/conference_commands.c
    src/configdir.c
    src/curl_util.c
    src/execute.c
    src/file_transfers.c
    src/global_commands.c
    src/help.c
    src/input.c
    src/line_info.c
    src/log.c
    src/message_queue.c
    src/misc_tools.c
    src/name_lookup.c
    src/notify.c
    src/prompt.c
    src/python_api.c
    src/qr_code.c
    src/settings.c
    src/term_mplex.c
    src/toxic.c
    src/toxic_strings.c
    src/video_call.c
    src/video_device.c
    src/windows.c
)

target_compile_features(${PROJECT_NAME} PRIVATE c_std_99)
set_target_properties(${PROJECT_NAME}
    PROPERTIES
        C_STANDARD_REQUIRED YES
        C_EXTENSIONS NO
)

target_compile_options(${PROJECT_NAME}
    PRIVATE
        -Wall
        -Wpedantic
        -Wunused
        -fstack-protector-all
        -Wvla
        -Wmissing-field-initializers
        -Wno-missing-braces
)

target_compile_definitions(${PROJECT_NAME}
    PRIVATE
        $<$<BOOL:${OpenAL_FOUND}>:AUDIO>
        $<$<BOOL:${X11_FOUND}>:X11>
        TOXIC_VER="${PROJECT_VERSION}"
        HAVE_WIDECHAR
        _XOPEN_SOURCE_EXTENDED
        _FILE_OFFSET_BITS=64
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        $<$<BOOL:${MATH_LIBRARY}>:${MATH_LIBRARY}>
        Threads::Threads
        CURL::libcurl
        ${CURSES_LIBRARIES}
        toxcore::toxcore
        ${OPENAL_LIBRARY}
        libconfig::libconfig
        ${X11_LIBRARIES}
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${CURSES_INCLUDE_DIRS}
        ${OPENAL_INCLUDE_DIR}
        ${X11_INCLUDE_DIR}
)
