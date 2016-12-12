macro(set_named_compiler_options PROJECT)
    if(MSVC)
      target_compile_options(${PROJECT} 
        PRIVATE "/MT$<$<CONFIG:Debug>:d>" 
        PRIVATE "-W3"
      )
    else()
      target_compile_options(${PROJECT} 
        PRIVATE "-std=c++14" 
        PRIVATE "-Wall"
      )
    endif()

    if (COMPILE_OPTIONS)
        foreach(COMPILE_OPTION ${COMPILE_OPTIONS})
            target_compile_options(${PROJECT} PRIVATE ${COMPILE_OPTION})
        endforeach()
    endif()
endmacro()

macro(set_compiler_options)
  set_named_compiler_options(${PROJECT_NAME})
endmacro()