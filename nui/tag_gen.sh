mDir="lib/src/domain/logic/model"
pDir="lib/proto"
gDir="$mDir/grpc"

# This will run proto_generator to generate lib/proto/model.proto
dart run build_runner build || exit
echo "Build completed!"

# create the lib/src/grpc directory
mkdir -p "$gDir" || exit
mkdir -p "$pDir" || exit

echo "Directories created!"

# this will run the protoc compiler to generate lib/src/grpc/model.pb.dart, lib/src/grpc/model.pbenum.dart and lib/src/grpc/model.pbjson.dart files
protoc --dart_out=grpc:"$gDir" -I="$pDir"  ./"$pDir"/tags.proto || exit
echo "Protoc generated"

# OPTIONAL - this reformats the proto file
clang-format -i ./"$pDir"/tags.proto || exit
echo "CLang formatted!"