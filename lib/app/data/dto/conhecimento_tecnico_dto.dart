class ConhecimentoTecnicoDto {
  int? index;
  String? nivelConhecimento;
  int? totalColaboradorPorNivel;
  double? mediaNivelConhecimento;
  double? percentualColaborador;

  ConhecimentoTecnicoDto(
      {this.index,
      this.nivelConhecimento,
      this.totalColaboradorPorNivel,
      this.mediaNivelConhecimento,
      this.percentualColaborador});
}
