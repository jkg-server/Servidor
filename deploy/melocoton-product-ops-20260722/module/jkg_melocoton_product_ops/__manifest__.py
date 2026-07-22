{
    "name": "JKG Melocotón · Gestión rápida de productos",
    "summary": "Alta, importación y cambio de precios protegidos para El Melocotón",
    "version": "19.0.1.0.0",
    "category": "Point of Sale",
    "author": "JKG Computer",
    "license": "LGPL-3",
    "depends": [
        "base",
        "product",
        "account",
        "uom",
        "point_of_sale",
    ],
    "external_dependencies": {
        "python": ["openpyxl", "requests", "PIL"],
    },
    "data": [
        "security/ir.model.access.csv",
        "wizard/product_ops_views.xml",
    ],
    "installable": True,
    "application": True,
    "auto_install": False,
}
