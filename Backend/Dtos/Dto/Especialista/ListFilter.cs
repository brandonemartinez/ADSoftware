namespace Dtos.Dto.Especialista
{
    public class ListFilter
    {
                public string Nombre {get; set;}
                public string Apellido {get; set;}
                public string Oficio {get; set;}
                public decimal? Calificacion {get; set;}
                public string OrderBy {get; set;}
                public bool OrderByMethod { get; set; } 


    }
}
