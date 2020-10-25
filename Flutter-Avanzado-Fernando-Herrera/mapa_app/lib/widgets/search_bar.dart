part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusquedaBloc, BusquedaState>(
      builder: (context, state) {
        return !state.seleccionManual 
          ? FadeInDown(child: this._buildSearchBar(context)) 
          : Container();
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: width,
        child: GestureDetector(
          onTap: () async {
            print('buscando');
            final resultado = await showSearch(context: context, delegate: SearchDestination());
            this.retronoBusqueda(context, resultado);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            width: double.infinity,
            child: Text('¿Dónde quieres ir?', style: TextStyle(color: Colors.black87)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 5)
                )
              ]
            ),
            // child: ,
          ),
        ),
      ),
    );
  }

  void retronoBusqueda(BuildContext context, SearchResult result) {
    if (result.cancelo) return;

    if (result.manual) {
      context.bloc<BusquedaBloc>().add(OnActivarMarcadorManual());
      return;
    }

  }
}