using System;
using System.Collections.Generic;
using Core.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Data
{
    public partial class DB_CATALOGO_SERVICIOSContext : DbContext
    {
        public DB_CATALOGO_SERVICIOSContext()
        {
        }

        public DB_CATALOGO_SERVICIOSContext(DbContextOptions<DB_CATALOGO_SERVICIOSContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Busqueda> Busqueda { get; set; } = null!;
        public virtual DbSet<Cita> Cita { get; set; } = null!;
        public virtual DbSet<Ciudad> Ciudads { get; set; } = null!;
        public virtual DbSet<Departamento> Departamentos { get; set; } = null!;
        public virtual DbSet<Especialista> Especialista { get; set; } = null!;
        public virtual DbSet<HistorialPago> HistorialPagos { get; set; } = null!;
        public virtual DbSet<Oficio> Oficios { get; set; } = null!;
        public virtual DbSet<OficioEspecialista> OficioEspecialista { get; set; } = null!;
        public virtual DbSet<Paquete> Paquetes { get; set; } = null!;
        public virtual DbSet<RegistroAuditoria> RegistroAuditoria { get; set; } = null!;
        public virtual DbSet<Usuario> Usuarios { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-OOUOF3H\\MSSQLSERVER01;Initial Catalog=DB_CATALOGO_SERVICIOS;Integrated Security=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Busqueda>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CantidadResultado).HasColumnName("cantidadResultado");

                entity.Property(e => e.Fecha)
                    .HasColumnType("date")
                    .HasColumnName("fecha");

                entity.Property(e => e.Hora).HasColumnName("hora");

                entity.Property(e => e.IdCliente).HasColumnName("idCliente");

                entity.Property(e => e.IdDepartamento).HasColumnName("idDepartamento");

                entity.Property(e => e.Oficio)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("oficio");

                entity.HasOne(d => d.IdClienteNavigation)
                    .WithMany(p => p.Busqueda)
                    .HasForeignKey(d => d.IdCliente)
                    .HasConstraintName("FK__Busqueda__idClie__403A8C7D");

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Busqueda)
                    .HasForeignKey(d => d.IdDepartamento)
                    .HasConstraintName("FK__Busqueda__idDepa__3F466844");
            });

            modelBuilder.Entity<Cita>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Estado)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("estado");

                entity.Property(e => e.EstadoPago).HasColumnName("estadoPago");

                entity.Property(e => e.Fecha)
                    .HasColumnType("date")
                    .HasColumnName("fecha");

                entity.Property(e => e.Hora).HasColumnName("hora");

                entity.HasMany(d => d.IdUsuarios)
                    .WithMany(p => p.IdCita)
                    .UsingEntity<Dictionary<string, object>>(
                        "CitaUsuario",
                        l => l.HasOne<Usuario>().WithMany().HasForeignKey("IdUsuario").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__CitaUsuar__idUsu__440B1D61"),
                        r => r.HasOne<Cita>().WithMany().HasForeignKey("IdCita").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__CitaUsuar__idCit__4316F928"),
                        j =>
                        {
                            j.HasKey("IdCita", "IdUsuario");

                            j.ToTable("CitaUsuario");

                            j.IndexerProperty<int>("IdCita").HasColumnName("idCita");

                            j.IndexerProperty<int>("IdUsuario").HasColumnName("idUsuario");
                        });
            });

            modelBuilder.Entity<Ciudad>(entity =>
            {
                entity.HasKey(e => e.IdDepartamento);

                entity.ToTable("Ciudad");

                entity.Property(e => e.IdDepartamento)
                    .ValueGeneratedNever()
                    .HasColumnName("idDepartamento");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithOne(p => p.Ciudad)
                    .HasForeignKey<Ciudad>(d => d.IdDepartamento)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Ciudad__idDepart__267ABA7A");
            });

            modelBuilder.Entity<Departamento>(entity =>
            {
                entity.ToTable("Departamento");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Especialista>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("id");

                entity.Property(e => e.Calificacion).HasColumnName("calificacion");

                entity.Property(e => e.DepartamentoDisponible)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("departamentoDisponible");

                entity.Property(e => e.Fotos)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("fotos");

                entity.Property(e => e.HoraDesde).HasColumnName("horaDesde");

                entity.Property(e => e.HoraHasta).HasColumnName("horaHasta");

                entity.Property(e => e.IdPaquete).HasColumnName("idPaquete");

                entity.Property(e => e.NombreFantasia)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombreFantasia");

                entity.Property(e => e.RangoDia)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("rangoDia");

                entity.Property(e => e.RazonSocial)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("razonSocial");

                entity.Property(e => e.FotoPerfil)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("fotoPerfil");
                
                entity.Property(e => e.Presentacion)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("presentacion");

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.Especialista)
                    .HasForeignKey<Especialista>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Especialista__id__2E1BDC42");

                entity.HasOne(d => d.IdPaqueteNavigation)
                    .WithMany(p => p.Especialista)
                    .HasForeignKey(d => d.IdPaquete)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Especiali__idPaq__2F10007B");
            });

            modelBuilder.Entity<HistorialPago>(entity =>
            {
                entity.ToTable("HistorialPago");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Concepto)
                    .HasMaxLength(70)
                    .IsUnicode(false)
                    .HasColumnName("concepto");

                entity.Property(e => e.Fecha)
                    .HasColumnType("datetime")
                    .HasColumnName("fecha");

                entity.Property(e => e.Monto)
                    .HasColumnType("decimal(18, 0)")
                    .HasColumnName("monto");

                entity.HasMany(d => d.IdUsuarios)
                    .WithMany(p => p.IdHistorialPagos)
                    .UsingEntity<Dictionary<string, object>>(
                        "HistorialPagoUsuario",
                        l => l.HasOne<Usuario>().WithMany().HasForeignKey("IdUsuario").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Historial__idUsu__34C8D9D1"),
                        r => r.HasOne<HistorialPago>().WithMany().HasForeignKey("IdHistorialPago").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Historial__idHis__33D4B598"),
                        j =>
                        {
                            j.HasKey("IdHistorialPago", "IdUsuario");

                            j.ToTable("HistorialPagoUsuario");

                            j.IndexerProperty<int>("IdHistorialPago").HasColumnName("idHistorialPago");

                            j.IndexerProperty<int>("IdUsuario").HasColumnName("idUsuario");
                        });
            });

            modelBuilder.Entity<Oficio>(entity =>
            {
                entity.ToTable("Oficio");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<OficioEspecialista>(entity =>
            {
                entity.HasKey(e => new { e.IdEspecialista, e.IdOficio });

                entity.Property(e => e.IdEspecialista).HasColumnName("idEspecialista");

                entity.Property(e => e.IdOficio).HasColumnName("idOficio");

                entity.HasOne(d => d.IdEspecialistaNavigation)
                    .WithMany(p => p.OficioEspecialista)
                    .HasForeignKey(d => d.IdEspecialista)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OficioEsp__idEsp__398D8EEE");

                entity.HasOne(d => d.IdOficioNavigation)
                    .WithMany(p => p.OficioEspecialista)
                    .HasForeignKey(d => d.IdOficio)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OficioEsp__idOfi__3A81B327");
            });

            modelBuilder.Entity<Paquete>(entity =>
            {
                entity.ToTable("Paquete");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.CantidadCiudades).HasColumnName("cantidadCiudades");

                entity.Property(e => e.CantidadProfesiones).HasColumnName("cantidadProfesiones");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.Precio)
                    .HasColumnType("decimal(18, 0)")
                    .HasColumnName("precio");
            });

            modelBuilder.Entity<RegistroAuditoria>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.FechaEvento)
                    .HasColumnType("datetime")
                    .HasColumnName("fechaEvento");

                entity.Property(e => e.NombreTabla)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("nombreTabla");

                entity.Property(e => e.Token)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("token");

                entity.Property(e => e.Valores)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("valores");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.ToTable("Usuario");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Activo).HasColumnName("activo");

                entity.Property(e => e.Apellido)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("apellido");

                entity.Property(e => e.Contrasenia)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("contrasenia");

                entity.Property(e => e.Correo)
                    .HasMaxLength(70)
                    .IsUnicode(false)
                    .HasColumnName("correo");

                entity.Property(e => e.Direccion)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("direccion");

                entity.Property(e => e.FechaNacimiento)
                    .HasColumnType("date")
                    .HasColumnName("fechaNacimiento");

                entity.Property(e => e.Genero)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("genero");

                entity.Property(e => e.IdDepartamento).HasColumnName("idDepartamento");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.NombreUsuario)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombreUsuario");

                entity.Property(e => e.Rol)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("rol");

                entity.Property(e => e.Telefono)
                    .HasMaxLength(70)
                    .IsUnicode(false)
                    .HasColumnName("telefono");

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdDepartamento)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Usuario__idDepar__29572725");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
