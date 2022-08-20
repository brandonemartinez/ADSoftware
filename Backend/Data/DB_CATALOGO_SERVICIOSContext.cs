using System;
using System.Collections.Generic;
using Data.Models;
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

        public virtual DbSet<Busqueda> Busqueda { get; set; }
        public virtual DbSet<Cita> Cita { get; set; }
        public virtual DbSet<Ciudad> Ciudads { get; set; }
        public virtual DbSet<Cliente> Clientes { get; set; }
        public virtual DbSet<Departamento> Departamentos { get; set; }
        public virtual DbSet<Disponibilidad> Disponibilidads { get; set; }
        public virtual DbSet<Especialista> Especialista { get; set; }
        public virtual DbSet<HistorialPago> HistorialPagos { get; set; }
        public virtual DbSet<Oficio> Oficios { get; set; }
        public virtual DbSet<OficioEspecialista> OficioEspecialistas { get; set; }
        public virtual DbSet<Plane> Planes { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }

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

                entity.Property(e => e.CantidadResultados).HasColumnName("cantidadResultados");

                entity.Property(e => e.DocumentoCliente)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("documentoCliente");

                entity.Property(e => e.Fecha)
                    .HasColumnType("date")
                    .HasColumnName("fecha");

                entity.Property(e => e.Hora).HasColumnName("hora");

                entity.Property(e => e.IdDepartamento).HasColumnName("idDepartamento");

                entity.Property(e => e.Oficio)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("oficio");

                entity.HasOne(d => d.DocumentoClienteNavigation)
                    .WithMany(p => p.Busqueda)
                    .HasForeignKey(d => d.DocumentoCliente)
                    .HasConstraintName("FK__Busqueda__docume__4316F928");

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Busqueda)
                    .HasForeignKey(d => d.IdDepartamento)
                    .HasConstraintName("FK__Busqueda__idDepa__4222D4EF");
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

                entity.HasMany(d => d.Documentos)
                    .WithMany(p => p.IdCita)
                    .UsingEntity<Dictionary<string, object>>(
                        "CitaUsuario",
                        l => l.HasOne<Usuario>().WithMany().HasForeignKey("Documento").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__CitaUsuar__docum__46E78A0C"),
                        r => r.HasOne<Cita>().WithMany().HasForeignKey("IdCita").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__CitaUsuar__idCit__45F365D3"),
                        j =>
                        {
                            j.HasKey("IdCita", "Documento");

                            j.ToTable("CitaUsuario");

                            j.IndexerProperty<int>("IdCita").HasColumnName("idCita");

                            j.IndexerProperty<string>("Documento").HasMaxLength(30).IsUnicode(false).HasColumnName("documento");
                        });
            });

            modelBuilder.Entity<Ciudad>(entity =>
            {
                entity.HasKey(e => new { e.Ciudad1, e.IdDepartamento });

                entity.ToTable("Ciudad");

                entity.Property(e => e.Ciudad1)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("ciudad");

                entity.Property(e => e.IdDepartamento).HasColumnName("idDepartamento");

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Ciudads)
                    .HasForeignKey(d => d.IdDepartamento)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Ciudad__idDepart__267ABA7A");
            });

            modelBuilder.Entity<Cliente>(entity =>
            {
                entity.HasKey(e => e.Documento)
                    .HasName("PK__Cliente__A25B3E60349E3541");

                entity.ToTable("Cliente");

                entity.Property(e => e.Documento)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("documento");

                entity.HasOne(d => d.DocumentoNavigation)
                    .WithOne(p => p.Cliente)
                    .HasForeignKey<Cliente>(d => d.Documento)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Cliente__documen__2C3393D0");
            });

            modelBuilder.Entity<Departamento>(entity =>
            {
                entity.ToTable("Departamento");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Disponibilidad>(entity =>
            {
                entity.ToTable("Disponibilidad");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Documento)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("documento");

                entity.Property(e => e.Fecha)
                    .HasColumnType("date")
                    .HasColumnName("fecha");

                entity.Property(e => e.Hora).HasColumnName("hora");

                entity.HasOne(d => d.DocumentoNavigation)
                    .WithMany(p => p.Disponibilidads)
                    .HasForeignKey(d => d.Documento)
                    .HasConstraintName("FK__Disponibi__docum__49C3F6B7");

                entity.HasMany(d => d.IdDepartamentos)
                    .WithMany(p => p.IdDisponibilidads)
                    .UsingEntity<Dictionary<string, object>>(
                        "DisponibilidadDepartamento",
                        l => l.HasOne<Departamento>().WithMany().HasForeignKey("IdDepartamento").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Disponibi__idDep__4D94879B"),
                        r => r.HasOne<Disponibilidad>().WithMany().HasForeignKey("IdDisponibilidad").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Disponibi__idDis__4CA06362"),
                        j =>
                        {
                            j.HasKey("IdDisponibilidad", "IdDepartamento");

                            j.ToTable("DisponibilidadDepartamento");

                            j.IndexerProperty<int>("IdDisponibilidad").HasColumnName("idDisponibilidad");

                            j.IndexerProperty<int>("IdDepartamento").HasColumnName("idDepartamento");
                        });
            });

            modelBuilder.Entity<Especialista>(entity =>
            {
                entity.HasKey(e => e.Documento)
                    .HasName("PK__Especial__A25B3E6052EA9DC6");

                entity.Property(e => e.Documento)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("documento");

                entity.Property(e => e.Calificacion).HasColumnName("calificacion");

                entity.Property(e => e.Fotos)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("fotos");

                entity.Property(e => e.IdPlanes).HasColumnName("idPlanes");

                entity.Property(e => e.RazonSocial)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("razonSocial");

                entity.HasOne(d => d.DocumentoNavigation)
                    .WithOne(p => p.Especialista)
                    .HasForeignKey<Especialista>(d => d.Documento)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Especiali__docum__30F848ED");

                entity.HasOne(d => d.IdPlanesNavigation)
                    .WithMany(p => p.Especialista)
                    .HasForeignKey(d => d.IdPlanes)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Especiali__idPla__31EC6D26");
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
                        l => l.HasOne<Usuario>().WithMany().HasForeignKey("IdUsuario").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Historial__idUsu__37A5467C"),
                        r => r.HasOne<HistorialPago>().WithMany().HasForeignKey("IdHistorialPago").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Historial__idHis__36B12243"),
                        j =>
                        {
                            j.HasKey("IdHistorialPago", "IdUsuario");

                            j.ToTable("HistorialPagoUsuario");

                            j.IndexerProperty<int>("IdHistorialPago").HasColumnName("idHistorialPago");

                            j.IndexerProperty<string>("IdUsuario").HasMaxLength(30).IsUnicode(false).HasColumnName("idUsuario");
                        });
            });

            modelBuilder.Entity<Oficio>(entity =>
            {
                entity.ToTable("Oficio");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<OficioEspecialista>(entity =>
            {
                entity.HasKey(e => new { e.Documento, e.IdOficio });

                entity.Property(e => e.Documento)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("documento");

                entity.Property(e => e.IdOficio).HasColumnName("idOficio");

                entity.Property(e => e.Certificaciones)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("certificaciones");

                entity.HasOne(d => d.DocumentoNavigation)
                    .WithMany(p => p.OficioEspecialista)
                    .HasForeignKey(d => d.Documento)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OficioEsp__docum__3C69FB99");

                entity.HasOne(d => d.IdOficioNavigation)
                    .WithMany(p => p.OficioEspecialista)
                    .HasForeignKey(d => d.IdOficio)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OficioEsp__idOfi__3D5E1FD2");
            });

            modelBuilder.Entity<Plane>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.CantidadCiudades).HasColumnName("cantidadCiudades");

                entity.Property(e => e.CantidadProfesiones).HasColumnName("cantidadProfesiones");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.Precio)
                    .HasColumnType("decimal(18, 0)")
                    .HasColumnName("precio");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.Documento)
                    .HasName("PK__Usuario__A25B3E6018C07D92");

                entity.ToTable("Usuario");

                entity.Property(e => e.Documento)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("documento");

                entity.Property(e => e.Apellido)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("apellido");

                entity.Property(e => e.Contrasenia)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("contrasenia");

                entity.Property(e => e.Correo)
                    .IsRequired()
                    .HasMaxLength(70)
                    .IsUnicode(false)
                    .HasColumnName("correo");

                entity.Property(e => e.IdDepartamento).HasColumnName("idDepartamento");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.Telefono)
                    .IsRequired()
                    .HasMaxLength(70)
                    .IsUnicode(false)
                    .HasColumnName("telefono");

                entity.Property(e => e.User)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("usuario");

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
