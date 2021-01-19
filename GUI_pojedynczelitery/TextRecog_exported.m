classdef TextRecog_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        TextRecognitionUIFigure  matlab.ui.Figure
        LoadImageButton          matlab.ui.control.Button
        BinaryzationButton       matlab.ui.control.Button
        SegmentationButton       matlab.ui.control.Button
        TextrecognitionButton    matlab.ui.control.Button
        OutputEditFieldLabel     matlab.ui.control.Label
        OutputEditField          matlab.ui.control.EditField
        UIAxes                   matlab.ui.control.UIAxes
    end

    
    % zmienne widoczne w calej klasie, odwolanie app.bim
    properties (Access = public)
        imageFile % Description
        bim % binarny obraz
        labels % etykiety
        nnl % siec neuronowa
    end
    
    % metody widoczne w calej klasie, wywolanie bin_im(...)
    methods (Access = private)
        
        function [gray_im,bim] = bin_im(app)
            gray_im = im2gray(app.imageFile);
            app.bim = ~imbinarize(gray_im,.25); 
        end

    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: LoadImageButton
        function LoadImageButtonPushed(app, event)
            [filename, filepath] = uigetfile({'*.*';'*.jpg';'*.png';'*.bmp'}, 'Choose file to load');
            FullFileName = [filepath filename];
            
            %load image
            app.imageFile = double(imread(FullFileName))/255;
            imshow(app.imageFile,'parent',app.UIAxes);
        end

        % Button pushed function: BinaryzationButton
        function binarizationButtonPushed(app, event)
            bin_im(app);
            imshow(app.bim,'parent',app.UIAxes);

        end

        % Button pushed function: SegmentationButton
        function SegmentationButtonPushed(app, event)
            app.labels = bwlabel(app.bim);
            bin_im(app);
            imshow(label2rgb(app.labels),'parent',app.UIAxes);
        end
        
        % Button pushed function: TextrecognitionButton
        function TextrecognitionButtonPushed(app, event)
            imgTest = zeros(1, 59);
            test = rgb2gray(app.imageFile);
            LBPfeatures = extractLBPFeatures(test);
            for j = 1:59
                imgTest(1,j) =  LBPfeatures(j);
            end
            out = app.nnl.nn(imgTest');
%             result = zeros(1,length(out));
            maximum = max(out(:));
            position = find(out == maximum);
%             for i = 1:length(out)
%                 result(i) = app.nnl.dict(find());
%             end
            app.OutputEditField.Value = app.nnl.dict(position);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create TextRecognitionUIFigure and hide until all components are created
            app.TextRecognitionUIFigure = uifigure('Visible', 'off');
            app.TextRecognitionUIFigure.Color = [0.4118 0.3804 0.3804];
            app.TextRecognitionUIFigure.Position = [100 100 935 605];
            app.TextRecognitionUIFigure.Name = 'TextRecognition';

            % Create LoadImageButton
            app.LoadImageButton = uibutton(app.TextRecognitionUIFigure, 'push');
            app.LoadImageButton.ButtonPushedFcn = createCallbackFcn(app, @LoadImageButtonPushed, true);
            app.LoadImageButton.Position = [710 380 176 43];
            app.LoadImageButton.Text = 'Load Image';

            % Create BinaryzationButton
            app.BinaryzationButton = uibutton(app.TextRecognitionUIFigure, 'push');
            app.BinaryzationButton.ButtonPushedFcn = createCallbackFcn(app, @binarizationButtonPushed, true);
            app.BinaryzationButton.Position = [695 149 100 22];
            app.BinaryzationButton.Text = 'Binaryzation';

            % Create SegmentationButton
            app.SegmentationButton = uibutton(app.TextRecognitionUIFigure, 'push');
            app.SegmentationButton.ButtonPushedFcn = createCallbackFcn(app, @SegmentationButtonPushed, true);
            app.SegmentationButton.Position = [810 149 100 22];
            app.SegmentationButton.Text = 'Segmentation';

            % Create TextrecognitionButton
            app.TextrecognitionButton = uibutton(app.TextRecognitionUIFigure, 'push');
            app.TextrecognitionButton.ButtonPushedFcn = createCallbackFcn(app, @TextrecognitionButtonPushed, true);
            app.TextrecognitionButton.Position = [710 306 176 41];
            app.TextrecognitionButton.Text = 'Text recognition';

            % Create OutputEditFieldLabel
            app.OutputEditFieldLabel = uilabel(app.TextRecognitionUIFigure);
            app.OutputEditFieldLabel.HorizontalAlignment = 'right';
            app.OutputEditFieldLabel.Position = [92 52 42 22];
            app.OutputEditFieldLabel.Text = 'Output';

            % Create OutputEditField
            app.OutputEditField = uieditfield(app.TextRecognitionUIFigure, 'text');
            app.OutputEditField.Position = [143 52 464 22];
            app.OutputEditField.Value = '...';

            % Create UIAxes
            app.UIAxes = uiaxes(app.TextRecognitionUIFigure);
            app.UIAxes.XTick = [];
            app.UIAxes.YTick = [];
            app.UIAxes.Position = [2 100 694 452];

            % Show the figure after all components are created
            app.TextRecognitionUIFigure.Visible = 'on';
            
            
            %load neural
            app.nnl = load ('ocr_model_dokladny_final.mat');
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = TextRecog_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.TextRecognitionUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.TextRecognitionUIFigure)
        end
    end
end