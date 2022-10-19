import 'package:coliscontas/database/user/user_repository.dart';
import 'package:coliscontas/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  pickAndUploadImage(UserModel user) async {
    XFile? file = await getImage();
    if (file != null) {
      await UserRepository().uploadImageStorage(user, file.path);
    }
  }
}
