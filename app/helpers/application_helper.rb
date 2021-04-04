module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: 'bg-green-400',
      error: 'bg-red-400',
      alert: 'bg-yellow-700',
      notice: 'bg-blue-400'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
