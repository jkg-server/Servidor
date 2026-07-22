from odoo import fields, models


class JkgMelocotonProductOperationLog(models.Model):
    _name = "jkg.melocoton.product.operation.log"
    _description = "Historial de gestión rápida de productos"
    _order = "create_date desc, id desc"

    operation = fields.Selection(
        selection=[
            ("create", "Nuevo producto"),
            ("import", "Importación Excel"),
            ("price", "Cambio de precio"),
        ],
        required=True,
        readonly=True,
    )
    product_id = fields.Many2one(
        comodel_name="product.template",
        string="Producto",
        readonly=True,
        ondelete="set null",
    )
    barcode = fields.Char(readonly=True)
    old_price = fields.Float(readonly=True)
    new_price = fields.Float(readonly=True)
    status = fields.Selection(
        selection=[
            ("ok", "Correcto"),
            ("review", "Revisión"),
            ("error", "Error"),
        ],
        required=True,
        readonly=True,
        default="ok",
    )
    detail = fields.Text(readonly=True)
    user_id = fields.Many2one(
        comodel_name="res.users",
        string="Usuario",
        readonly=True,
        default=lambda self: self.env.user,
    )
    company_id = fields.Many2one(
        comodel_name="res.company",
        readonly=True,
        default=lambda self: self.env.company,
    )
