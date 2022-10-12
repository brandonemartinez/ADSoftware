namespace Data.Dto.Especialista
{
    public class ListFilter
    {
                public string Nombre {get; set;}
                public string Apellido {get; set;}
                public string Oficio {get; set;}
                public string Calificacion {get; set;}
                public string OrderBy {get; set;}
                public int? Page { get; set; }
    }
}
