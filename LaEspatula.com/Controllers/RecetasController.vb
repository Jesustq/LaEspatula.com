Imports System.Web.Mvc

Public Class RecetasController
    Inherits Controller

    ' GET: /Recetas
    Function Index() As ActionResult
        Return View()
    End Function

    Function Nueva() As ActionResult
        ViewData("Message") = "Agregar una nueva receta"

        Return View()
    End Function

End Class