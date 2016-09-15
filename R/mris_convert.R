#' @title Use Freesurfers MRIs Converter 
#' @description This function call  \code{mris_convert}, a 
#' general conversion program for converting between cortical surface file formats 
#' @param curv (character) input filename for curve
#' @param orig (character) file path for origin file
#' @param outfile (character) output file path 
#' @param ext (character) output file extension, default is set to .asc
#' @param verbose (logical) print diagnostic messages
#' @return Name of output file
#' @export
#' @examples 
#' if (have_fs()) {
#'  mris_convert(curvinfilepath = "lh.thickness", 
#'  origfilepath = "lh.white", 
#'  outfile = "lh.thickness.asc")  
#' } 
mris_convert = function(
  curv, 
  orig,
  outfile = NULL,
  ext = ".asc",
  verbose = TRUE){
  
  ######################################################    
  # Making output file if not specified
  ######################################################      
  if (is.null(outfile)) {
    outfile = tempfile(fileext = ext)
  }
   
  cmd <- paste("mris_convert -c", curv, 
               orig, outfile, sep = " ")
  cmd <- paste0(get_fs(), cmd)
  
  run_check_fs_cmd(cmd = cmd, outfile = outfile, verbose = verbose)

  return(outfile)
}


#' @title Help file for Freesurfers MRIs Converter 
#' @description This calls Freesurfer's \code{mris_convert} help 
#'
#' @return Result of \code{fs_help}
#' @export
mris_convert.help = function(){
  fs_help(func_name = "mris_convert")
}