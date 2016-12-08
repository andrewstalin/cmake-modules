macro(set_compiler_options)
    if(MSVC)
      target_compile_options(${PROJECT_NAME} 
        PRIVATE "/MT$<$<CONFIG:Debug>:d>" 
        PRIVATE "-W3"
      )
    else()
      target_compile_options(${PROJECT_NAME} 
        PRIVATE "-std=c++14" 
        PRIVATE "-Wall"
      )
    endif()

    if (COMPILE_OPTIONS)
        foreach(COMPILE_OPTION ${COMPILE_OPTIONS})
            target_compile_options(${PROJECT_NAME} PRIVATE ${COMPILE_OPTION})
        endforeach()
    endif()
endmacro()