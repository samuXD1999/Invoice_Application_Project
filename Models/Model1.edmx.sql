
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/12/2023 10:50:17
-- Generated from EDMX file: C:\Users\suraj\Downloads\Invoiceapplication\Invoiceapplication\Invoiceapplication\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [InvoiceDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[fk_customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblInvoice_details] DROP CONSTRAINT [fk_customer];
GO
IF OBJECT_ID(N'[dbo].[FK_fkinvcid]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblInvoice_payments] DROP CONSTRAINT [FK_fkinvcid];
GO
IF OBJECT_ID(N'[dbo].[FK_fkinvid]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblInvoice_products] DROP CONSTRAINT [FK_fkinvid];
GO
IF OBJECT_ID(N'[dbo].[FK_fkproid]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblInvoice_products] DROP CONSTRAINT [FK_fkproid];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[tblAccount_details]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblAccount_details];
GO
IF OBJECT_ID(N'[dbo].[tblCustomer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblCustomer];
GO
IF OBJECT_ID(N'[dbo].[tblInvoice_details]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblInvoice_details];
GO
IF OBJECT_ID(N'[dbo].[tblInvoice_payments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblInvoice_payments];
GO
IF OBJECT_ID(N'[dbo].[tblInvoice_products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblInvoice_products];
GO
IF OBJECT_ID(N'[dbo].[tblProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProduct];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'tblAccount_details'
CREATE TABLE [dbo].[tblAccount_details] (
    [account_id] int IDENTITY(1,1) NOT NULL,
    [user_id] varchar(50)  NOT NULL,
    [password] varchar(20)  NULL
);
GO

-- Creating table 'tblCustomers'
CREATE TABLE [dbo].[tblCustomers] (
    [customer_id] int IDENTITY(1,1) NOT NULL,
    [customer_name] varchar(20)  NULL,
    [email_address] varchar(50)  NULL,
    [mobile_number] varchar(15)  NULL,
    [password] varchar(20)  NULL,
    [city] varchar(20)  NULL
);
GO

-- Creating table 'tblInvoice_details'
CREATE TABLE [dbo].[tblInvoice_details] (
    [invoice_id] int IDENTITY(1,1) NOT NULL,
    [customer_id] int  NULL,
    [invoice_date] datetime  NULL,
    [invoice_amount] float  NULL
);
GO

-- Creating table 'tblInvoice_payments'
CREATE TABLE [dbo].[tblInvoice_payments] (
    [payment_id] int IDENTITY(1,1) NOT NULL,
    [invoice_id] int  NULL,
    [payment_date] datetime  NULL,
    [payment_amount] float  NULL,
    [payment_mode] varchar(50)  NULL,
    [description] varchar(200)  NULL
);
GO

-- Creating table 'tblInvoice_products'
CREATE TABLE [dbo].[tblInvoice_products] (
    [invoice_product_id] int IDENTITY(1,1) NOT NULL,
    [invoice_id] int  NULL,
    [product_id] int  NULL,
    [quantity] int  NULL
);
GO

-- Creating table 'tblProducts'
CREATE TABLE [dbo].[tblProducts] (
    [product_id] int IDENTITY(1,1) NOT NULL,
    [product_name] varchar(20)  NULL,
    [rate] float  NULL,
    [tax] float  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [account_id] in table 'tblAccount_details'
ALTER TABLE [dbo].[tblAccount_details]
ADD CONSTRAINT [PK_tblAccount_details]
    PRIMARY KEY CLUSTERED ([account_id] ASC);
GO

-- Creating primary key on [customer_id] in table 'tblCustomers'
ALTER TABLE [dbo].[tblCustomers]
ADD CONSTRAINT [PK_tblCustomers]
    PRIMARY KEY CLUSTERED ([customer_id] ASC);
GO

-- Creating primary key on [invoice_id] in table 'tblInvoice_details'
ALTER TABLE [dbo].[tblInvoice_details]
ADD CONSTRAINT [PK_tblInvoice_details]
    PRIMARY KEY CLUSTERED ([invoice_id] ASC);
GO

-- Creating primary key on [payment_id] in table 'tblInvoice_payments'
ALTER TABLE [dbo].[tblInvoice_payments]
ADD CONSTRAINT [PK_tblInvoice_payments]
    PRIMARY KEY CLUSTERED ([payment_id] ASC);
GO

-- Creating primary key on [invoice_product_id] in table 'tblInvoice_products'
ALTER TABLE [dbo].[tblInvoice_products]
ADD CONSTRAINT [PK_tblInvoice_products]
    PRIMARY KEY CLUSTERED ([invoice_product_id] ASC);
GO

-- Creating primary key on [product_id] in table 'tblProducts'
ALTER TABLE [dbo].[tblProducts]
ADD CONSTRAINT [PK_tblProducts]
    PRIMARY KEY CLUSTERED ([product_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [customer_id] in table 'tblInvoice_details'
ALTER TABLE [dbo].[tblInvoice_details]
ADD CONSTRAINT [fk_customer]
    FOREIGN KEY ([customer_id])
    REFERENCES [dbo].[tblCustomers]
        ([customer_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_customer'
CREATE INDEX [IX_fk_customer]
ON [dbo].[tblInvoice_details]
    ([customer_id]);
GO

-- Creating foreign key on [invoice_id] in table 'tblInvoice_payments'
ALTER TABLE [dbo].[tblInvoice_payments]
ADD CONSTRAINT [FK_fkinvcid]
    FOREIGN KEY ([invoice_id])
    REFERENCES [dbo].[tblInvoice_details]
        ([invoice_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_fkinvcid'
CREATE INDEX [IX_FK_fkinvcid]
ON [dbo].[tblInvoice_payments]
    ([invoice_id]);
GO

-- Creating foreign key on [invoice_id] in table 'tblInvoice_products'
ALTER TABLE [dbo].[tblInvoice_products]
ADD CONSTRAINT [FK_fkinvid]
    FOREIGN KEY ([invoice_id])
    REFERENCES [dbo].[tblInvoice_details]
        ([invoice_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_fkinvid'
CREATE INDEX [IX_FK_fkinvid]
ON [dbo].[tblInvoice_products]
    ([invoice_id]);
GO

-- Creating foreign key on [product_id] in table 'tblInvoice_products'
ALTER TABLE [dbo].[tblInvoice_products]
ADD CONSTRAINT [FK_fkproid]
    FOREIGN KEY ([product_id])
    REFERENCES [dbo].[tblProducts]
        ([product_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_fkproid'
CREATE INDEX [IX_FK_fkproid]
ON [dbo].[tblInvoice_products]
    ([product_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------