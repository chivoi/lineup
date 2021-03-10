class UploadFileInput < SimpleForm::Inputs::FileInput
  def input_html_options
    super.merge({ file_upload: true })
  end
end