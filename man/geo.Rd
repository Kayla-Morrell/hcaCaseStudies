% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geo.R
\name{geo_gsm_cell_count}
\alias{geo_gsm_cell_count}
\alias{geo_gsm_gene_count}
\alias{geo_gsm_count_matrix}
\title{Summarize GEO Files}
\usage{
geo_gsm_cell_count(.data, sep = "\\\\t")

geo_gsm_gene_count(.data)

geo_gsm_count_matrix(.data, reader_function = readr::read_tsv)
}
\arguments{
\item{.data}{a \code{files_tbl_hca} object (e.g., created from
\code{hca::files()}) containing \code{fileId} and \code{local.filePath}
columns. All rows in \code{.data} must refer to GSM files.}

\item{sep}{character(1) single character used to separate fields in
the GSM file. Typically tab (\verb{'\\\\t"}, default) or comma \code{","}.}

\item{reader_function}{a function to read each GSM file. The
function should come from the readr package. The default
\code{read_tsv} is appropriate for tab-delimited CSV files; a common
alternative is \code{read_csv} for comma-separated GSM files.}
}
\value{
\code{geo_gsm_cell_count()} returns \code{.data} augmented by a column
\code{local.cellCount} reporting the number of cells in the file.

\code{geo_gsm_gene_count()} returns \code{.data} augmented by a
column of gene counts, \code{"local.geneCount"}.

\code{geo_gsm_count_matrix()} returns a sparse matrix with rows
(genes) equal to the unique genes in all input files, and
columns (cells) equal to the total cell count in the GSM
files. Samples are in the order present in \code{.data}.
}
\description{
\code{geo_gsm_cell_count()} parses a GEO GSM file for the
number of cells present in the file.

\code{geo_gsm_gene_count()} parses a GEO GSM file for the
number of genes present in the file.

\code{geo_gsm_count_matrix()} returns a sparse matrix of
gene x cell counts.
}
\details{
\code{geo_gsm_cell_count()} parses the first line of the GSM
file, assuming that the line is a 'header' with gene as first
column and cell labels as subsequent columns. The number of
cells is the number of columns in the file minus 1.

\code{geo_gsm_gene_count()} counts the number of lines in the
file, and reports the number of genes as this number minus one,
assuming the first line is a 'header' line.

\code{geo_gsm_count_matrix()} parses each GEO GSM file in turn,
assuming that the file contains a dense matrix. The dense
matrix is converted to a sparse representation. As each file is
processed, new genes are appended to the original \code{i} index,
and cells are appended to the \code{j} index. The final result is
the concatenation of all sparse matrix
representations. Progress reports the amount of memory
currently consumed by the cummulating object.
}
