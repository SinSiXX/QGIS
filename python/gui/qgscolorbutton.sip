
/** \ingroup gui
 * \class QgsColorButton
 * A cross platform button subclass for selecting colors. Will open a color chooser dialog when clicked.
 * Offers live updates to button from color chooser dialog
 * @note inherited base class moved from QToolButton to QPushButton in QGIS 1.9
 */

class QgsColorButton: QPushButton
{
%TypeHeaderCode
#include <qgscolorbutton.h>
%End

  public:
    /**
     * Construct a new color button.
     *
     * @param parent The parent QWidget for the dialog
     * @param cdt The title to show in the color chooser dialog
     * @param cdo Options for the color chooser dialog
     * @note changed in 1.9
     */
    QgsColorButton( QWidget *parent = 0, QString cdt = "", QColorDialog::ColorDialogOptions cdo = 0 );
    ~QgsColorButton();

    /**
     * Specify the current color. Will emit a colorChanged signal if the color is different to the previous.
     *
     * @param color the new color
     * @note added in 1.9
     */
    void setColor( const QColor &color );
    /**
     * Return the currently selected color.
     *
     * @return the currently selected color
     * @note added in 1.9
     */
    QColor color() const;

    /**
     * Specify the options for the color chooser dialog (e.g. alpha).
     *
     * @param cdo Options for the color chooser dialog
     * @note added in 1.9
     */
    void setColorDialogOptions( QColorDialog::ColorDialogOptions cdo );

    /**
     * Returns the options for the color chooser dialog.
     *
     * @return Options for the color chooser dialog
     * @note added in 1.9
     */
    QColorDialog::ColorDialogOptions colorDialogOptions();

    /**
     * Set the title, which the color chooser dialog will show.
     *
     * @param cdt Title for the color chooser dialog
     * @note added in 1.9
     */
    void setColorDialogTitle( QString cdt );

    /**
     * Returns the title, which the color chooser dialog shows.
     *
     * @return Title for the color chooser dialog
     * @note added in 1.9
     */
    QString colorDialogTitle();

    /**
     * Whether the button accepts live updates from QColorDialog.
     *
     * @note added in 1.9
     */
    bool acceptLiveUpdates();

    /**
     * Sets whether the button accepts live updates from QColorDialog.
     * Live updates may cause changes that are not undoable on QColorDialog cancel.
     *
     * @note added in 1.9
     */
    void setAcceptLiveUpdates( bool accept );

  public slots:
    /**
     * Sets the background pixmap for the button based upon set color and transparency.
     * Call directly to update background after adding/removing QColorDialog::ShowAlphaChannel option
     * but the color has not changed, i.e. setColor() wouldn't update button and
     * you want the button to retain the set color's alpha component regardless
     *
     * @note added in 1.9
     */
    void setButtonBackground();

  signals:
    /**
     * Is emitted, whenever a new color is accepted. The color is always valid.
     * In case the new color is the same, no signal is emitted, to avoid infinite loops.
     *
     * @param color New color
     * @note added in 1.9
     */
    void colorChanged( const QColor &color );

  protected:
    void changeEvent( QEvent* e );
    void showEvent( QShowEvent* e );
    static const QPixmap& transpBkgrd();
};
