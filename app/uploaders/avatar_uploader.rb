class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  #storage :fog
  #環境に応じて自動でアップロード先を切り替え
  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end
  
  #アップロードした画像の表示 S3のディレクトリ名
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  #デフォルト画像の設定
  # Provide a default URL as a default if there hasn't been a file uploaded:
  #def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #  ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  #end
  
  # 画像の上限を700pxにする #コメントアウトすると写真がアップできない
  #process :resize_to_limit => [700, 700]
  
  #
  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  
  # サムネイル画像
  #version :thumb do
  #   process resize_to_fill: [100, 100]
  #end

  def extension_allowlist
     %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  
  # 保存するファイルの命名規則
  def filename
     "#{secure_token}.#{file.extension}" if original_filename.present?
  end
  
  protected
  # 一意となるトークンを作成
  def secure_token
     var = :"@#{mounted_as}_secure_token"
     model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
  
end
