class QgsPointDisplacementRenderer : QgsFeatureRendererV2
{
%TypeHeaderCode
#include <qgspointdisplacementrenderer.h>
%End
  public:
    QgsPointDisplacementRenderer( const QString& labelAttributeName = "" );
    ~QgsPointDisplacementRenderer();

    QgsFeatureRendererV2* clone() /Factory/;

    virtual void toSld( QDomDocument& doc, QDomElement &element ) const;

    /**Reimplemented from QgsFeatureRendererV2*/
    bool renderFeature( QgsFeature& feature, QgsRenderContext& context, int layer = -1, bool selected = false, bool drawVertexMarker = false );

    QgsSymbolV2* symbolForFeature( QgsFeature& feature );

    void startRender( QgsRenderContext& context, const QgsVectorLayer *vlayer );

    void stopRender( QgsRenderContext& context );

    QList<QString> usedAttributes();
    QgsSymbolV2List symbols();

    //! create a renderer from XML element
    static QgsFeatureRendererV2* create( QDomElement& symbologyElem ) /Factory/;
    QDomElement save( QDomDocument& doc );

    QgsLegendSymbologyList legendSymbologyItems( QSize iconSize );

    //! @note not available in python bindings
    // QgsLegendSymbolList legendSymbolItems();

    void setLabelAttributeName( const QString& name );
    QString labelAttributeName() const;

    /**Sets embedded renderer (takes ownership)*/
    void setEmbeddedRenderer( QgsFeatureRendererV2* r /Transfer/ );
    QgsFeatureRendererV2* embeddedRenderer();

    //! not available in python bindings
    // void setDisplacementGroups( const QList<QMap<QgsFeatureId, QgsFeature> >& list );

    void setLabelFont( const QFont& f );
    QFont labelFont() const;

    void setCircleWidth( double w );
    double circleWidth() const;

    void setCircleColor( const QColor& c );
    QColor circleColor() const;

    void setLabelColor( const QColor& c );
    QColor labelColor() const;

    void setCircleRadiusAddition( double d );
    double circleRadiusAddition() const;

    void setMaxLabelScaleDenominator( double d );
    double maxLabelScaleDenominator() const;

    /**Returns the symbol for the center of a displacement group (but _not_ ownership of the symbol)*/
    QgsMarkerSymbolV2* centerSymbol();
    /**Sets the center symbol (takes ownership)*/
    void setCenterSymbol( QgsMarkerSymbolV2* symbol /Transfer/ );

    void setTolerance( double t );
    double tolerance() const;

  private:
    QgsPointDisplacementRenderer( const QgsPointDisplacementRenderer & );
    QgsPointDisplacementRenderer & operator=( const QgsPointDisplacementRenderer & );
};
