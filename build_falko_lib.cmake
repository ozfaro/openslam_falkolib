cmake_minimum_required(VERSION 3.0) 

message(STATUS "CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")

find_package(Boost)  
if (${Boost_FOUND})
  message(STATUS "Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
  message(STATUS "Boost_LIBRARY_DIRS: ${Boost_LIBRARY_DIRS}")
  message(STATUS "Boost_LIBRARIES: ${Boost_LIBRARY_DIRS}")
  include_directories(${Boost_INCLUDE_DIRS})
  link_directories(${Boost_LIBRARY_DIRS})
endif(${Boost_FOUND})

find_package(Eigen3 REQUIRED)
if (${EIGEN3_FOUND})
  include_directories(${EIGEN3_INCLUDE_DIR})
  message(STATUS "EIGEN3_INCLUDE_DIR: ${EIGEN3_INCLUDE_DIR}")
else(${EIGEN3_FOUND})
  message(WARNING "Cannot find Eigen3 Library")
endif(${EIGEN3_FOUND})


include_directories(include EXTERNAL)  

add_library(${PROJECT_NAME} 
  src/Common/HoughSpectrum.cpp
  src/Feature/FALKOExtractor.cpp
  src/Feature/OCExtractor.cpp
  src/Feature/CGH.cpp
  src/Feature/BSC.cpp
)

add_executable(testKeypointFalko test/testKeypointFalko.cpp test/testData.cpp)
target_link_libraries(testKeypointFalko ${PROJECT_NAME} ${Boost_LIBRARIES})

add_executable(testFalkoAHT test/testFalkoAHT.cpp test/testData.cpp)
target_link_libraries(testFalkoAHT ${PROJECT_NAME} ${Boost_LIBRARIES})

add_executable(testFalkoCC test/testFalkoCC.cpp test/testData.cpp)
target_link_libraries(testFalkoCC ${PROJECT_NAME} ${Boost_LIBRARIES})

add_executable(testKeypointOC test/testKeypointOC.cpp test/testData.cpp)
target_link_libraries(testKeypointOC ${PROJECT_NAME} ${Boost_LIBRARIES}) # boost_iostreams boost_system boost_filesystem

