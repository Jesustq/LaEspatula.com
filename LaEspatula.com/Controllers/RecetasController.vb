Imports System.Web.Mvc

Public Class RecetasController
    Inherits Controller

    ' GET: /Recetas
    Function Ver() As ActionResult
        Return View()
    End Function

    Function Cargar(value As String) As ActionResult
        ViewData("Id") = value
        Return View()
    End Function

    Function Nueva() As ActionResult
        ViewData("Message") = "Agregar una nueva receta"

        Return View()
    End Function

End Class