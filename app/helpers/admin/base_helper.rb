module Admin::BaseHelper
  def translate_flash_key_to_bootstrap_class(key)
    {
      :notice => "alert-success",
      :alert  => "alert-error"
    }[key]
  end
end
