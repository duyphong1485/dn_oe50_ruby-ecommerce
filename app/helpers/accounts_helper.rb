module AccountsHelper
  def gravatar_for account
    gravatar_id = Digest::MD5.hexdigest account.email
    gravatar_url = "https://i.pravatar.cc/150?img=3#{gravatar_id}"
    image_tag gravatar_url, alt: account.fullname, class: "gravatar"
  end
end
