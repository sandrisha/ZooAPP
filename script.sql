USE [zoo]
GO
/****** Object:  Table [dbo].[Clasificaciones]    Script Date: 12/06/2017 19:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificaciones](
	[idClasificacion] [int] NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clasificaciones] PRIMARY KEY CLUSTERED 
(
	[idClasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Especies]    Script Date: 12/06/2017 19:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especies](
	[idEspecie] [bigint] IDENTITY(1,1) NOT NULL,
	[idClasificacion] [int] NOT NULL,
	[idTipoAnimal] [bigint] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[nPatas] [smallint] NOT NULL,
	[esMascota] [bit] NULL,
 CONSTRAINT [PK_Especies] PRIMARY KEY CLUSTERED 
(
	[idEspecie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiposAnimal]    Script Date: 12/06/2017 19:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposAnimal](
	[idTipoAnimal] [bigint] NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposAnimal] PRIMARY KEY CLUSTERED 
(
	[idTipoAnimal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Clasificaciones] ([idClasificacion], [denominacion]) VALUES (1, N'Estructura')
INSERT [dbo].[Clasificaciones] ([idClasificacion], [denominacion]) VALUES (2, N'Alimentación')
INSERT [dbo].[Clasificaciones] ([idClasificacion], [denominacion]) VALUES (3, N'Medio')
SET IDENTITY_INSERT [dbo].[Especies] ON 

INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (10, 1, 1, N'Mamífero', 4, 1)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (11, 2, 2, N'Aves', 2, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (12, 3, 3, N'Réptiles', 4, 0)
SET IDENTITY_INSERT [dbo].[Especies] OFF
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (1, N'Vertebrados')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (2, N'Invertebrados')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (3, N'Acuáticos')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (4, N'Terrestres')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (5, N'Hervíboros')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (6, N'Carnivoros')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (7, N'Omnívoros')
ALTER TABLE [dbo].[Especies] ADD  CONSTRAINT [DF_Especies_nPatas]  DEFAULT ((4)) FOR [nPatas]
GO
ALTER TABLE [dbo].[Especies]  WITH CHECK ADD  CONSTRAINT [FK_Especies_Clasificaciones] FOREIGN KEY([idClasificacion])
REFERENCES [dbo].[Clasificaciones] ([idClasificacion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Especies] CHECK CONSTRAINT [FK_Especies_Clasificaciones]
GO
ALTER TABLE [dbo].[Especies]  WITH CHECK ADD  CONSTRAINT [FK_Especies_Especies] FOREIGN KEY([idEspecie])
REFERENCES [dbo].[Especies] ([idEspecie])
GO
ALTER TABLE [dbo].[Especies] CHECK CONSTRAINT [FK_Especies_Especies]
GO
ALTER TABLE [dbo].[Especies]  WITH CHECK ADD  CONSTRAINT [FK_Especies_TiposAnimal] FOREIGN KEY([idTipoAnimal])
REFERENCES [dbo].[TiposAnimal] ([idTipoAnimal])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Especies] CHECK CONSTRAINT [FK_Especies_TiposAnimal]
GO
ALTER TABLE [dbo].[TiposAnimal]  WITH CHECK ADD  CONSTRAINT [FK_TiposAnimal_TiposAnimal] FOREIGN KEY([idTipoAnimal])
REFERENCES [dbo].[TiposAnimal] ([idTipoAnimal])
GO
ALTER TABLE [dbo].[TiposAnimal] CHECK CONSTRAINT [FK_TiposAnimal_TiposAnimal]
GO
