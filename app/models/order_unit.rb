class OrderUnit < ApplicationRecord
  has_one :order, dependent: :restrict_with_error

  validates :code, presence: true

  def qrcode
    qrcode = RQRCode::QRCode.new(Rails.application.routes.url_helpers.order_unit_url(self))
    qrcode.as_svg(
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true,
      use_path: true
    ).html_safe # rubocop:disable Rails/OutputSafety
  end

  def to_param
    code
  end
end
