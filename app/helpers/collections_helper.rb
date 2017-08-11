module CollectionsHelper
  def collections_count
    if current_user.blank?
      return 0
      else
        return current_user.collections_count    # 直接取存取的字段（收藏）
    end
  end
end
