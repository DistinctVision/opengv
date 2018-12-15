TEMPLATE = lib
CONFIG += c++11

CONFIG -= app_bundle
CONFIG -= qt

CONFIG += shared

CONFIG += no_batch object_parallel_to_source

android {
   LIBS += -L$$[QT_INSTALL_PLUGINS]/platforms/android
}

CONFIG(debug, debug|release) {
    TARGET = opengvd

    DESTDIR += $$PWD/../build/
    OBJECTS_DIR = $$PWD/../build/debug/obj
} else {
    TARGET = opengv

    DESTDIR += $$PWD/../build/
    OBJECTS_DIR = $$PWD/../build/release/obj
}

windows  {
    QMAKE_CXXFLAGS += /bigobj
}

QMAKE_CXXFLAGS += -Wno-unused-function

linux {
    INCLUDEPATH += /usr/local/include/eigen3
    DEPENDPATH += /usr/local/include/eigen3
    INCLUDEPATH += /usr/local/include/eigen3/unsupported
    DEPENDPATH += /usr/local/include/eigen3/unsupported
} else {
    error("Eigen not included")
}

HEADERS += \
  include/opengv/types.hpp \
  include/opengv/OptimizationFunctor.hpp \
  include/opengv/absolute_pose/methods.hpp \
  include/opengv/relative_pose/methods.hpp \
  include/opengv/triangulation/methods.hpp \
  include/opengv/point_cloud/methods.hpp \
  include/opengv/math/cayley.hpp \
  include/opengv/math/quaternion.hpp \
  include/opengv/math/arun.hpp \
  include/opengv/math/Sturm.hpp \
  include/opengv/math/roots.hpp \
  include/opengv/math/gauss_jordan.hpp \
  include/opengv/absolute_pose/AbsoluteAdapterBase.hpp \
  include/opengv/absolute_pose/CentralAbsoluteAdapter.hpp \
  include/opengv/absolute_pose/NoncentralAbsoluteAdapter.hpp \
  include/opengv/absolute_pose/NoncentralAbsoluteMultiAdapter.hpp \
  include/opengv/absolute_pose/AbsoluteMultiAdapterBase.hpp \
  include/opengv/relative_pose/RelativeAdapterBase.hpp \
  include/opengv/relative_pose/RelativeMultiAdapterBase.hpp \
  include/opengv/relative_pose/CentralRelativeAdapter.hpp \
  include/opengv/relative_pose/CentralRelativeWeightingAdapter.hpp \
  include/opengv/relative_pose/NoncentralRelativeAdapter.hpp \
  include/opengv/relative_pose/CentralRelativeMultiAdapter.hpp \
  include/opengv/relative_pose/NoncentralRelativeMultiAdapter.hpp \
  include/opengv/point_cloud/PointCloudAdapterBase.hpp \
  include/opengv/point_cloud/PointCloudAdapter.hpp \
  include/opengv/sac_problems/absolute_pose/AbsolutePoseSacProblem.hpp \
  include/opengv/sac_problems/absolute_pose/MultiNoncentralAbsolutePoseSacProblem.hpp \
  include/opengv/sac_problems/relative_pose/CentralRelativePoseSacProblem.hpp \
  include/opengv/sac_problems/relative_pose/NoncentralRelativePoseSacProblem.hpp \
  include/opengv/sac_problems/relative_pose/MultiCentralRelativePoseSacProblem.hpp \
  include/opengv/sac_problems/relative_pose/MultiNoncentralRelativePoseSacProblem.hpp \
  include/opengv/sac_problems/relative_pose/EigensolverSacProblem.hpp \
  include/opengv/sac_problems/relative_pose/RotationOnlySacProblem.hpp \
  include/opengv/sac_problems/relative_pose/TranslationOnlySacProblem.hpp \
  include/opengv/sac_problems/point_cloud/PointCloudSacProblem.hpp \
  include/opengv/absolute_pose/MACentralAbsolute.hpp \
  include/opengv/absolute_pose/MANoncentralAbsolute.hpp \
  include/opengv/relative_pose/MACentralRelative.hpp \
  include/opengv/relative_pose/MANoncentralRelative.hpp \
  include/opengv/relative_pose/MANoncentralRelativeMulti.hpp \
  include/opengv/point_cloud/MAPointCloud.hpp

SOURCES += \
  src/absolute_pose/modules/main.cpp \
  src/absolute_pose/modules/gp3p/code.cpp \
  src/absolute_pose/modules/gp3p/init.cpp \
  src/absolute_pose/modules/gp3p/reductors.cpp \
  src/absolute_pose/modules/gp3p/spolynomials.cpp \
  src/absolute_pose/modules/Epnp.cpp \
  src/absolute_pose/modules/gpnp1/code.cpp \
  src/absolute_pose/modules/gpnp1/init.cpp \
  src/absolute_pose/modules/gpnp1/reductors.cpp \
  src/absolute_pose/modules/gpnp1/spolynomials.cpp \
  src/absolute_pose/modules/gpnp2/code.cpp \
  src/absolute_pose/modules/gpnp2/init.cpp \
  src/absolute_pose/modules/gpnp2/reductors.cpp \
  src/absolute_pose/modules/gpnp2/spolynomials.cpp \
  src/absolute_pose/modules/gpnp3/code.cpp \
  src/absolute_pose/modules/gpnp3/init.cpp \
  src/absolute_pose/modules/gpnp3/reductors.cpp \
  src/absolute_pose/modules/gpnp3/spolynomials.cpp \
  src/absolute_pose/modules/gpnp4/code.cpp \
  src/absolute_pose/modules/gpnp4/init.cpp \
  src/absolute_pose/modules/gpnp4/reductors.cpp \
  src/absolute_pose/modules/gpnp4/spolynomials.cpp \
  src/absolute_pose/modules/gpnp5/code.cpp \
  src/absolute_pose/modules/gpnp5/init.cpp \
  src/absolute_pose/modules/gpnp5/reductors.cpp \
  src/absolute_pose/modules/gpnp5/spolynomials.cpp \
  src/absolute_pose/modules/upnp2.cpp \
  src/absolute_pose/modules/upnp4.cpp \
  src/relative_pose/modules/main.cpp \
  src/relative_pose/modules/fivept_nister/modules.cpp \
  src/relative_pose/modules/fivept_stewenius/modules.cpp \
  src/relative_pose/modules/fivept_kneip/code.cpp \
  src/relative_pose/modules/fivept_kneip/init.cpp \
  src/relative_pose/modules/fivept_kneip/reductors.cpp \
  src/relative_pose/modules/fivept_kneip/spolynomials.cpp \
  src/relative_pose/modules/sixpt/modules2.cpp \
  src/relative_pose/modules/eigensolver/modules.cpp \
  src/relative_pose/modules/ge/modules.cpp \
  src/math/cayley.cpp \
  src/math/quaternion.cpp \
  src/math/arun.cpp \
  src/math/Sturm.cpp \
  src/math/roots.cpp \
  src/math/gauss_jordan.cpp \
  src/absolute_pose/methods.cpp \
  src/absolute_pose/CentralAbsoluteAdapter.cpp \
  src/absolute_pose/NoncentralAbsoluteAdapter.cpp \
  src/absolute_pose/NoncentralAbsoluteMultiAdapter.cpp \
  src/relative_pose/methods.cpp \
  src/relative_pose/CentralRelativeAdapter.cpp \
  src/relative_pose/CentralRelativeWeightingAdapter.cpp \
  src/relative_pose/NoncentralRelativeAdapter.cpp \
  src/relative_pose/CentralRelativeMultiAdapter.cpp \
  src/relative_pose/NoncentralRelativeMultiAdapter.cpp \
  src/triangulation/methods.cpp \
  src/point_cloud/methods.cpp \
  src/point_cloud/PointCloudAdapter.cpp \
  src/sac_problems/absolute_pose/AbsolutePoseSacProblem.cpp \
  src/sac_problems/absolute_pose/MultiNoncentralAbsolutePoseSacProblem.cpp \
  src/sac_problems/relative_pose/CentralRelativePoseSacProblem.cpp \
  src/sac_problems/relative_pose/NoncentralRelativePoseSacProblem.cpp \
  src/sac_problems/relative_pose/RotationOnlySacProblem.cpp \
  src/sac_problems/relative_pose/TranslationOnlySacProblem.cpp \
  src/sac_problems/relative_pose/EigensolverSacProblem.cpp \
  src/sac_problems/relative_pose/MultiCentralRelativePoseSacProblem.cpp \
  src/sac_problems/relative_pose/MultiNoncentralRelativePoseSacProblem.cpp \
  src/sac_problems/point_cloud/PointCloudSacProblem.cpp \
  src/absolute_pose/MACentralAbsolute.cpp \
  src/absolute_pose/MANoncentralAbsolute.cpp \
  src/relative_pose/MACentralRelative.cpp \
  src/relative_pose/MANoncentralRelative.cpp \
  src/relative_pose/MANoncentralRelativeMulti.cpp \
  src/point_cloud/MAPointCloud.cpp
